class JobsController < ApplicationController
  # GET /jobs
  # GET /jobs.xml
  def index
    @jobs = Job.paginate(:page => params[:page], :per_page =>11, :conditions => {:activate => 1}, :order => 'updated_at DESC')
    @records_for_more_button = Job.find(:all, :conditions => {:activate => 1})

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @jobs }
      format.js
    end
  end

  # GET /jobs/1
  # GET /jobs/1.xml
  def show
    @job = Job.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @job }
    end
  end

  # GET /jobs/new
  # GET /jobs/new.xml
  def new
    @job = Job.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @job }
    end
  end

  # GET /jobs/1/edit
  def edit
    @job = Job.find(params[:id])
  end


  def create_after_login
    @job = Job.new(params[:job])
    @job[:activate] = 1
    unless session[:registered_user_id].nil? then
      @user = User.find_by_id(session[:registered_user_id])
      @job.user_id = @user.id
    end
    respond_to do |format|
      if @job.save
        flash[:notice] = 'Job was successfully created.'
        format.html { redirect_to "/jobs" }
        #JobMailer.deliver_job_posting_confirmation(@job)
        format.xml  { render :xml => @job, :status => :created, :location => @job }
      else
        format.html { render :action => "index" }
        format.xml  { render :xml => @job.errors, :status => :unprocessable_entity }
      end
    end
  end
  # POST /jobs
  # POST /jobs.xml
  def create
    unless params[:ex_email].blank? or params[:ex_email].nil? or params[:ex_password].blank? or params[:ex_password].blank? or params[:ex_password].nil? then
      
      @job = Job.new(params[:job])
      @job.activation_key = SecureRandom.hex(4)

      @user_name = params[:ex_email]
      @password = params[:ex_password]

      @user = User.find_by_email(params[:ex_email])
      unless @user.nil? then
        logger.info "@user.password : #{@user.password}}"
        if @user.password == params[:ex_password] then
          session[:loggedin_user] = @user.id
          @job.update_attribute(:activate, 1)
          respond_to do |format|
            if @job.save
              flash[:notice] = 'Job was successfully created.'
              format.html { redirect_to "/jobs" }
              #JobMailer.deliver_job_posting_confirmation(@job)
              format.xml  { render :xml => @job, :status => :created, :location => @job }
            else
              format.html { render :action => "index" }
              format.xml  { render :xml => @job.errors, :status => :unprocessable_entity }
            end
          end
          

        else
          flash[:flash19] = "the username or password you entered is incorrect."
          redirect_to "/jobs"
        end
      else
        flash[:flash20] = "the username or password you entered is incorrect."
        redirect_to "/jobs"
      end

      
    else
      @job = Job.new(params[:job])
      @job.activation_key = SecureRandom.hex(4)

      respond_to do |format|
        if @job.save
          flash[:notice] = 'Job was successfully created.'
          format.html { render :action => "thanks_for_posting_job" }
          JobMailer.deliver_job_posting_confirmation(@job)
          format.xml  { render :xml => @job, :status => :created, :location => @job }
        else
          format.html { render :action => "index" }
          format.xml  { render :xml => @job.errors, :status => :unprocessable_entity }
        end
      end
    end    
  end

  # PUT /jobs/1
  # PUT /jobs/1.xml
  def update
    @job = Job.find(params[:id])

    respond_to do |format|
      if @job.update_attributes(params[:job])
        flash[:notice] = 'Job was successfully updated.'
        format.html { redirect_to(@job) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @job.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.xml
  def destroy
    @job = Job.find(params[:id])
    @job.destroy

    respond_to do |format|
      format.html { redirect_to(jobs_url) }
      format.xml  { head :ok }
    end
  end


  def activate
    @job = Job.find_by_activation_key(params[:id])
    @job.update_attribute(:activate, 1)
    #    session[:user_activated_to_show_page] = true
    #    session[:loggedin_user] = @user.id
    unless @job.nil? or @job.blank? then
      redirect_to "/jobs"
    else
      redirect_to "/jobs"
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
      @searchresults = ActsAsXapian::Search.new([Job], @search_string, :limit => 20, :conditions => {:activate => 1} ,:sort_by_prefix => "updated_at")
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

  
end
