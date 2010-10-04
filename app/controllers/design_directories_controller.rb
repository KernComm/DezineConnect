class DesignDirectoriesController < ApplicationController
  # GET /design_directories
  # GET /design_directories.xml
  def index
    @title = "Design Directory of Indian design companies"
    @records_for_more_button = DesignDirectory.find(:all, :joins => :user, :conditions => {:users => {:activate => 1}})
    @design_directories = DesignDirectory.paginate(:page => params[:page], :per_page => 18, :joins => :user, :conditions => {:users => {:activate => 1}} , :order => 'updated_at DESC')
    logger.info "@more_array : #{@design_directories.total_entries.inspect}"
    respond_to do |format|
      format.html
      format.js
    end
  end

  end

  # GET /design_directories/1
  # GET /design_directories/1.xml
  def show
    @design_directory = DesignDirectory.find(params[:id])

    @title = "#{@design_directory.company_name.capitalize} #{@design_directory.key_service.capitalize}, #{@design_directory.city.capitalize}, #{@design_directory.country.capitalize}"
    
    #    @portfolio_previous_value = @portfolio
    #    @portfolio_next_value = @portfolio.next
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @design_directory }
    end
  end

  # GET /design_directories/new
  # GET /design_directories/new.xml
  def new
    @design_directory = DesignDirectory.new
    logger.info "In new"
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @design_directory }
    end
  end
  

  # GET /design_directories/1/edit
  def edit
    @design_directory = DesignDirectory.find(params[:id])
  end

  # POST /design_directories
  # POST /design_directories.xml
  def create
    logger.info "got params ---  : #{params[:design_directory].inspect}"
    @design_directory = DesignDirectory.new(params[:design_directory])
    unless session[:registered_user_id].nil? then
      logger.info "session[:registered_user_id] : #{session[:registered_user_id].inspect}"
      @user = User.find_by_id(session[:registered_user_id])
      @design_directory.user_id = @user.id
    end

    @existing_record = DesignDirectory.find(:all, :joins => :user, :conditions => {:users => {:id => @user.id}})
    logger.info "Before Delete Existing Record : #{@existing_record.inspect}"
    @existing_record.each do | existing_record |
      existing_record.destroy
    end

      
     

    logger.info "Before Save: #{@design_directory.inspect}"
    respond_to do |format|
      if @design_directory.save
        logger.info "DesignDirectory was successfully created."
        flash[:notice] = 'DesignDirectory was successfully created.'
        format.html { render :action => "specifications", :id => @design_directory.id }
      else
        logger.info "NO not DesignDirectory was successfully created."
        format.html { render :action => "new" }
        format.xml  { render :xml => @design_directory.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /design_directories/1
  # PUT /design_directories/1.xml
  def update
    @design_directory = DesignDirectory.find(params[:id])
    respond_to do |format|
      if @design_directory.update_attributes(params[:design_directory])
        flash[:notice] = 'DesignDirectory was successfully updated.'
        format.html { redirect_to("/design_directories/edit/#{@design_directory.id}") }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @design_directory.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /design_directories/1
  # DELETE /design_directories/1.xml
  def destroy
    @design_directory = DesignDirectory.find(params[:id])
    @design_directory.destroy

    respond_to do |format|
      format.html { redirect_to(design_directories_url) }
      format.xml  { head :ok }
    end
  end

  def specifications
    @design_directory = DesignDirectory.find(params[:id])
  end


  def edit_specifications
    @design_directory = DesignDirectory.find(params[:id])
  end

  def update_design_directory_specifications
    @title = "Create Design Directory - ThankYou"
    @design_directory = DesignDirectory.find(params[:id])
    render :action => "thankyou", :id => @design_directory.id
    # @design_directory.update_attributes(params[:portfolio])
    params.keys.each do | params_value |
      if params_value.include? "description_" then
        image_id = params_value.split("_")[1]
        image_obj = Image.find(image_id)
        logger.info "params['description_'+image_id]:#{params['description_'+image_id]}"
        image_obj.update_attribute(:description, params['description_'+image_id])
        image_obj.update_attribute(:set_name, "My Design Directory") 
      end
    end
    DesignDirectoryMailer.deliver_design_directory_confirmation(@design_directory.user)
  end


  def update_design_directory_specifications_after_edit
    @design_directory = DesignDirectory.find(params[:id])
    params.keys.each do | params_value |
      if params_value.include? "description_" then
        image_id = params_value.split("_")[1]
        image_obj = Image.find(image_id)
        image_obj.update_attribute(:description, params['description_'+image_id])    
        image_obj.update_attribute(:set_name, "My Design Directory")
        unless params[:Filedata].nil? or params[:Filedata].blank? then
          image_obj.image = params[:Filedata]
          image_obj.save
        end
      end
    end
    render :controller => "design_directories",:action => "edit_specifications", :id => @design_directory.id

  end




  def delete_image
    @image = Image.find(params[:id])
    @design_directory = DesignDirectory.find(@image.design_directory_id)
    @image.destroy

    respond_to do |format|
      format.html { redirect_to("/design_directories/edit_specifications/#{@design_directory.id}") }
      format.xml  { head :ok }
    end
  end

  def search
    @search_string = ""

    unless params[:search_textfield].nil? then
      @search_string = @search_string + params[:search_textfield]
    end

    logger.info "@search_string: #{@search_string}"

    session[:search_string] = @search_string

    unless @search_string.blank? then
      @searchresults = ActsAsXapian::Search.new([DesignDirectory], @search_string, :limit => 3, :joins => :user, :conditions => {:users => {:activate => 1}} ,:sort_by_prefix => "updated_at")
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

  def redirect
    @design_directory = DesignDirectory.find_by_custom_url(params[:custom_url])
    unless @design_directory.nil? or @design_directory.blank? then
      respond_to do |format|
        format.html { render :action => "show", :id => @design_directory.id }
      end
    else     
      render :action => "notfound"
    end   
  end

  
end
