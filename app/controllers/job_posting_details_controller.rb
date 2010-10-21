class JobPostingDetailsController < ApplicationController
  # GET /job_posting_details
  # GET /job_posting_details.xml
  def index
    @job_posting_details = JobPostingDetail.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @job_posting_details }
    end
  end

  # GET /job_posting_details/1
  # GET /job_posting_details/1.xml
  def show
    @job_posting_detail = JobPostingDetail.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @job_posting_detail }
    end
  end

  # GET /job_posting_details/new
  # GET /job_posting_details/new.xml
  def new
    @job_posting_detail = JobPostingDetail.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @job_posting_detail }
    end
  end

  # GET /job_posting_details/1/edit
  def edit
    @job_posting_detail = JobPostingDetail.find(params[:id])
  end

  # POST /job_posting_details
  # POST /job_posting_details.xml
  def create
    @job_posting_detail = JobPostingDetail.new(params[:job_posting_detail])

    respond_to do |format|
      if @job_posting_detail.save
        flash[:notice] = 'JobPostingDetail was successfully created.'
        format.html { redirect_to(@job_posting_detail) }
        format.xml  { render :xml => @job_posting_detail, :status => :created, :location => @job_posting_detail }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @job_posting_detail.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /job_posting_details/1
  # PUT /job_posting_details/1.xml
  def update
    @job_posting_detail = JobPostingDetail.find(params[:id])

    respond_to do |format|
      if @job_posting_detail.update_attributes(params[:job_posting_detail])
        flash[:notice] = 'JobPostingDetail was successfully updated.'
        format.html { redirect_to(@job_posting_detail) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @job_posting_detail.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /job_posting_details/1
  # DELETE /job_posting_details/1.xml
  def destroy
    @job_posting_detail = JobPostingDetail.find(params[:id])
    @job_posting_detail.destroy

    respond_to do |format|
      format.html { redirect_to(job_posting_details_url) }
      format.xml  { head :ok }
    end
  end
end
