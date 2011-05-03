class PortfoliosController < ApplicationController
  before_filter :is_registered_user, :only => [ :edit ]
  require 'rake' 
  # GET /portfolios
  # GET /portfolios.xml

  def initialize
    @more_array = Array.new
  end

  def index
    @title = "Portfolios of Indian designers"
    @portfolios = Portfolio.paginate(:page => params[:page], :per_page =>18, :joins => :user, :conditions => {:users => {:activate => 1}} , :order => 'updated_at DESC')
    logger.info "@more_array : #{@portfolios.total_entries.inspect}"
  end

  # GET /portfolios/1
  # GET /portfolios/1.xml
  def show
    @portfolio = Portfolio.find(params[:id])
    unless @portfolio.user.activate == 1 then
      
      @title = "#{@portfolio.user.firstname.capitalize} #{@portfolio.user.lastname.capitalize}, #{@portfolio.city.capitalize}, #{@portfolio.country.capitalize}, #{@portfolio.specialization.capitalize}"
      #    @portfolio_previous_value = @portfolio
      #    @portfolio_next_value = @portfolio.next
    else
      render :action => "thankyou", :id => @portfolio.id
    end
  end

  # GET /portfolios/new
  # GET /portfolios/new.xml
  def new
    @title = "Create Portfolio - Profile Information"
    @portfolio = Portfolio.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @portfolio }
    end
  end

  # GET /portfolios/1/edit
  def edit
    @title = "Edit - Profile Information"
    @portfolio = Portfolio.find(params[:id]) 
  end


  # POST /portfolios
  # POST /portfolios.xml
  def create
    @title = "Create Portfolio - Upload Portfolio"
    unless params[:portfolio].nil? then
      @portfolio = Portfolio.new(params[:portfolio])
      @portfolio.specialization = params[:portfolio][:specialization].split("_")[0]
      @portfolio.secondary_specializations_2 = params[:portfolio][:specialization].split("_")[1]
    else  
      @portfolio = Portfolio.find_by_id(session[:existing_portfolio_id])
    end
    
    unless session[:registered_user_id].nil? then
      @user = User.find_by_id(session[:registered_user_id])
      @portfolio.user_id = @user.id
      @portfolio.user_firstname = @user.firstname
      @portfolio.user_lastname = @user.lastname
    end

      @existing_record = Portfolio.find(:all, :joins => :user, :conditions => {:users => {:id => @user.id}})
      logger.info "Before Delete Existing Record : #{@existing_record.inspect}"
	      @existing_record.each do | existing_record |
	            existing_record.destroy
              end

    respond_to do |format|
      if @portfolio.save
       
        session[:registered_portfolio_id] = @portfolio.id
        @existing_images = Image.find(:all, :conditions => { :portfolio_id => @portfolio.id })
        flash[:notice] = 'Portfolio was successfully created.'
        format.html { render :action => "specifications", :id => @portfolio.id }
        #format.html { redirect_to "/portfolios/specifications/#{@portfolio.id}" }
        format.xml  { render :xml => @portfolio, :status => :created, :location => @portfolio }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @portfolio.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /portfolios/1
  # PUT /portfolios/1.xml
  def update
    @portfolio = Portfolio.find(params[:id])
    
    @portfolio.secondary_specializations_2 = params[:portfolio][:specialization].split("_")[1]

    logger.info "IN Edit and @portfolios : #{params[:portfolio][:specialization].split("_")[0]}"
    respond_to do |format|
      if @portfolio.update_attributes(params[:portfolio])
        if params[:portfolio][:specialization].split("_")[0] == 'Other' then
          logger.info "IN Edit and @portfolios : #{params[:portfolio][:specialization].split("_")[0]}"
          logger.info "IN Edit and @portfolios : #{params['secondary_specilizations_text']}"
          @portfolio.update_attribute(:secondary_specializations_2, params['secondary_specilizations_text'])
          flash[:notice5] = 'Portfolio was successfully updated.'
        else
          @portfolio.update_attribute(:specialization, params[:portfolio][:specialization].split("_")[0])
        end
        flash[:notice5] = 'Portfolio was successfully updated.'
        logger.info "Updated portfolio with ID : #{@portfolio.id}"
        format.html { redirect_to("/portfolios/edit/#{@portfolio.id}") }
        format.xml  { head :ok }
      else
        format.html { render :action => "/portfolios/edit/#{@portfolio.id}" }
        format.xml  { render :xml => @portfolio.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /portfolios/1
  # DELETE /portfolios/1.xml
  def destroy
    @portfolio = Portfolio.find(params[:id])
    @portfolio.destroy

    respond_to do |format|
      format.html { redirect_to(portfolios_url) }
      format.xml  { head :ok }
    end
  end

  def specifications
    @portfolio = Portfolio.find(params[:id])
  end

  def update_portfolio_specifications
    @title = "Create Portfolio - ThankYou"
    @portfolio = Portfolio.find(params[:id])
    render :action => "thankyou", :id => @portfolio.id
    @portfolio.update_attributes(params[:portfolio])
    params.keys.each do | params_value |
      if params_value.include? "description_" then
        image_id = params_value.split("_")[1]
        image_obj = Image.find(image_id)
        image_obj.update_attribute(:description, params['description_'+image_id])
        if params['set_name'].empty? then
          image_obj.update_attribute(:set_name, "My Portfolio")
        else
          image_obj.update_attribute(:set_name, params['set_name'])
        end
      end
    end
    Portfoliomailer.deliver_portfolio_confirmation(@portfolio.user)
  end

   def update_portfolio_specifications_after_edit
    @portfolio = Portfolio.find(params[:id])
    @portfolio.update_attributes(params[:portfolio])
    params.keys.each do | params_value |
      if params_value.include? "description_" then
        image_id = params_value.split("_")[1]
        image_obj = Image.find(image_id)
        image_obj.update_attribute(:description, params['description_'+image_id])
        unless params['set_name'].nil? then
          if params['set_name'].empty? then
            image_obj.update_attribute(:set_name, "My Portfolio")
          else
            image_obj.update_attribute(:set_name, params['set_name'])
          end
        end
      end
    end
     render :action => "show", :id => @portfolio.id
  end

  def search
    @search_string = ""
    
    unless params[:search_textfield].nil? then
      @search_string = @search_string + params[:search_textfield]
    end

    logger.info "@search_string: #{@search_string}"

    session[:search_string] = @search_string

    unless @search_string.blank? then
      @searchresults = ActsAsXapian::Search.new([Portfolio], @search_string, :limit => 18, :joins => :user, :conditions => {:users => {:activate => 1}} ,:sort_by_prefix => "updated_at")
      if @searchresults.matches_estimated == 0 then
        logger.info "@searchresults.matches_estimated"
        flash[:message] = "no results match your search criteria. try searching a location or a keyword - eg: 'mumbai', 'product designer'"
      else
        flash[:search_message] = "You have searched for '#{@search_string}'"
      end
      logger.info "@searchresults for portfolios   #{@searchresults.matches}"
    else
      redirect_to :action => "index"
    end
  end

  def delete_image_navigation
     logger.info "params[:id] in delete image navigation : #{params[:id]}"
     unless params[:id].nil? or params[:id].blank? or params[:id].empty? then
       format.html { render :action => "specifications", :id => params[:id] }
     end
  end

  def edit_portfolio
    @title = "Edit - Portfolio"
    @portfolio = Portfolio.find(params[:id])
  end

   def delete_image

    @image = Image.find(params[:id])
    @portfolio = Portfolio.find(@image.portfolio_id)
    @image.destroy

    respond_to do |format|
      format.html { redirect_to("/portfolios/edit_portfolio/#{@portfolio.id}") }
      format.xml  { head :ok }
    end
  end
end
