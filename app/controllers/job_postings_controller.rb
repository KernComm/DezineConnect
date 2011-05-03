include JobPostingsHelper

class JobPostingsController < ApplicationController
 

  protect_from_forgery :only => [:create]
  # GET /job_postings
  # GET /job_postings.xml
 
  def index
    @jobpostings = JobPosting.paginate(:page => params[:page], :per_page => 5, :order => 'created_at DESC')
  end

  def search
    @search_string = ""
    session[:job_type_full_time] = params[:job_type_full_time]
    
    unless params[:search_textfield].nil? then
      @search_string = @search_string + params[:search_textfield]
    end

    unless params[:job_type_full_time].nil? then
      @search_string = @search_string + " " + params[:job_type_full_time]
    end
    
    logger.info "@search_string: #{@search_string}"
    unless @search_string.blank? then
    
      @searchresults = ActsAsXapian::Search.new([JobPosting], @search_string, :limit => 100, :sort_by_prefix => "created_at")
      logger.info "@searchresults in job_postings: #{@searchresults.matches}"
     
    else
      redirect_to :action => "index"
    end
  end
  
  # GET /job_postings/1
  # GET /job_postings/1.xml
  def show
    @job_posting = JobPosting.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @job_posting }
    end
  end

  # GET /job_postings/new
  # GET /job_postings/new.xml
  def new
    @job_posting = JobPosting.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @job_posting }
    end
  end

  # GET /job_postings/1/edit
  def edit
    @job_posting = JobPosting.find(params[:id])

    logger.info " Job posting Email : #{@job_posting.inspect}"

  end

  # POST /job_postings
  # POST /job_postings.xml
  def create

    logger.info " Job posting Email : #{params[:job_posting][:email]}"
    
    # @email_address_of_job_poster contains email address of the user while login.
    @email_address_of_job_poster = JobPosting.find_by_email(params[:job_posting][:email])
    
    unless @email_address_of_job_poster.nil? then

      
      # set the params@email_address_of_job_poster.email value to session to use this session variable in future
      session[:login_mailid] = @email_address_of_job_poster.email
      session[:login_password] = @email_address_of_job_poster.password

      flash[:notice] = 'Logged in successfully. Go Ahead and Post the Job.'

      respond_to do |format|
        format.js { }
      end
   
    else
      @job_posting = JobPosting.new(params[:job_posting])

      respond_to do |format|
        if @job_posting.save
          

          # set the params[:job_posting][:email] value to session to use this session variable in future
          @email_address_of_job_poster = JobPosting.find_by_email(params[:job_posting][:email])
          JobPostingMailer.deliver_login_confirmation(@email_address_of_job_poster)

          unless @email_address_of_job_poster.nil? then

            # set the params@email_address_of_job_poster.email value to session to use this session variable in future
            session[:login_mailid] = @email_address_of_job_poster.email
            session[:login_password] = @email_address_of_job_poster.password
            
          end

          flash[:notice] = 'Your account has been created successfully. Go Ahead and Post the Job.'
          
          format.html { redirect_to(@job_posting) }
          format.xml  { render :xml => @job_posting, :status => :created, :location => @job_posting }
          format.js { }
        else
          format.html { render :action => "new" }
          format.xml  { render :xml => @job_posting.errors, :status => :unprocessable_entity }
          format.js { }
        end
      end
    end
  end

  # PUT /job_postings/1
  # PUT /job_postings/1.xml
  def update
    @job_posting = JobPosting.find(params[:id])

    respond_to do |format|
      if @job_posting.update_attributes(params[:job_posting])
        flash[:notice] = 'JobPosting was successfully updated.'
        format.html { redirect_to(@job_posting) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @job_posting.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /job_postings/1
  # DELETE /job_postings/1.xml
  def destroy
    @job_posting = JobPosting.find(params[:id])
    @job_posting.destroy

    respond_to do |format|
      format.html { redirect_to(job_postings_url) }
      format.xml  { head :ok }
    end
  end

  def insert_job_details


    logger.info "params : #{params.inspect}"
    logger.info "Country : #{params[:country]}"
    if params[:country].blank? then
      params[:country] = "India"
    end
  
    @job_details = Hash.new

    @job_details[:job_type] = params[:job_type]
    @job_details[:job_title] = params[:JobTitle]
    @job_details[:company_name] = params[:CompanyName]
    @job_details[:company_website] = params[:CompanyWebsite]
    @job_details[:job_location] = params[:JobLocation]
    @job_details[:company_information] = params[:CompanyInformation]
    @job_details[:job_description] = params[:JobDescription]
    @job_details[:how_to_apply] = params[:Apply]
    @job_details[:email] = params[:send_application_email]
    @job_details[:anonymous_email] = anonymous_email_id
    @job_details[:favour] = 1
    @job_details[:country] = params[:country]
    @job_details[:min_exp] = params[:valueA]
    @job_details[:max_exp] = params[:valueB]
   

    @insert_job_posting_details = JobPosting.new(@job_details)
  
    unless params[:send_application_email].nil? then
      session[:how_to_apply_email] = params[:send_application_email]  
    end
    
    if @insert_job_posting_details.save!
      flash[:notice] = 'Values inserted successfully.'
      session[:jobposting_id] = @insert_job_posting_details.id
      redirect_to :controller => "job_postings", :action => "preview", :id => @insert_job_posting_details.id
    end

    logger.info "@job_details[:job_type] : #{@job_details.inspect}"


  
  end


  def update_job_details


    logger.info "params : #{params.inspect}"
    logger.info "Country : #{params[:country]}"
    if params[:country].blank? then
      params[:country] = "India"
    end
    @job_posting = JobPosting.find(params[:id])

    @job_details = Hash.new
    @job_details[:job_type] = params[:job_type]
    @job_details[:job_title] = params[:JobTitle]
    @job_details[:company_name] = params[:CompanyName]
    @job_details[:company_website] = params[:CompanyWebsite]
    @job_details[:job_location] = params[:JobLocation]
    @job_details[:company_information] = params[:CompanyInformation]
    @job_details[:job_description] = params[:JobDescription]
    @job_details[:how_to_apply] = params[:Apply]
    @job_details[:email] = params[:send_application_email]
    @job_details[:anonymous_email] = anonymous_email_id
    @job_details[:favour] = 1
    @job_details[:country] = params[:country]
    @job_details[:min_exp] = params[:valueA]
    @job_details[:max_exp] = params[:valueB]


    unless params[:send_application_email].nil? then
      session[:how_to_apply_email] = params[:send_application_email]
    else
      session[:how_to_apply_email] = params[:send_application_email]
    end

    if @job_posting.update_attributes(@job_details) then
      redirect_to :controller => "job_postings", :action => "preview", :id => @job_posting.id
    end

  end

  def preview
    @job_posting = JobPosting.find(params[:id])
  end


  def approve
    @job_posting = JobPosting.find(params[:id])
  end


  def apply_job
    @job_posting = JobPosting.find(params[:id])
    JobPostingMailer.deliver_apply_job_confirmation(@job_posting)
    redirect_to :action => "index"
  end


  
end
