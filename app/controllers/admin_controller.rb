class AdminController < ApplicationController
  before_filter :login_required
  
  def panel
    @user = User.find(:all, :order => 'created_at DESC')
    @user_active =  User.find(:all, :order => 'created_at DESC', :conditions => 'activate=1').length
    @user_inactive = User.find(:all, :order => 'created_at DESC', :conditions => 'activate=0').length
  end

  def portfolios   
    @user_active =  Portfolio.find(:all, :joins => :user, :conditions => {:users => {:activate => 1}},:order => 'created_at DESC').length
    @user_inactive = Portfolio.find(:all, :joins => :user, :conditions => {:users => {:activate => 0}},:order => 'created_at DESC').length
    @portfolios = Portfolio.find(:all, :order => 'created_at DESC')
  end
  
  def design_directory_images    
    @images = Image.find(:all, :order => 'created_at DESC', :conditions => 'design_directory_id = '+params[:id])
  end

  def portfolio_images
    @images = Image.find(:all, :order => 'created_at DESC', :conditions => 'portfolio_id = '+params[:id])
  end

  def design_directories
    @user_active =  DesignDirectory.find(:all, :joins => :user, :conditions => {:users => {:activate => 1}},:order => 'created_at DESC').length
    @user_inactive = DesignDirectory.find(:all, :joins => :user, :conditions => {:users => {:activate => 0}},:order => 'created_at DESC').length
    @user = User.find(:all, :order => 'created_at DESC')
    @design_directories = DesignDirectory.find(:all, :order => 'created_at DESC')
  end

 def jobs
  @jobs_active =  Job.find(:all, :conditions => {:activate => 1},:order => 'created_at DESC').length
  @jobs_inactive = Job.find(:all, :conditions => {:activate => 0},:order => 'created_at DESC').length
  @jobs = Job.find(:all, :order => 'created_at DESC')
  
 end
  

  def destroy
    @user = User.find(params[:id])
    flash[:notice] = "User #{@user.firstname} has been deleted successfully."
    @user.destroy
    respond_to do |format|
      format.html { redirect_to('/admin/portfolios') }
      format.xml  { head :ok }
    end   
  end
  
  def user_activate
    @user = User.find(params[:id])
    flash[:notice] = "User #{@user.firstname} has been activated successfully."
    @user.update_attribute(:activate, 1)
    respond_to do |format|
      format.html { redirect_to('/admin/panel') }
      format.xml  { head :ok }
    end
  end
  
  def user_deactivate
    @user = User.find(params[:id])
    flash[:notice] = "User #{@user.firstname} has been deactivated successfully."
    @user.update_attribute(:activate, 0)
    respond_to do |format|
      format.html { redirect_to('/admin/panel') }
      format.xml  { head :ok }
    end
  end

  def image_remove
    @image = Image.find(params[:id])
    @portfolio = Portfolio.find(@image.portfolio_id)
    @image.destroy
    respond_to do |format|
      format.html { redirect_to('/admin/portfolio_images/'+@image.portfolio_id) }
      format.xml  { head :ok }
    end
  end

  def directory_destroy
    @design_directory = DesignDirectory.find(params[:id])

    unless @design_directory.nil? or @design_directory.blank? then
      unless @design_directory.user.nil? or @design_directory.user.blank? then

        @design_directory.user.destroy
        
        @design_directory.destroy
      end
    end
   
    respond_to do |format|
      format.html { redirect_to('/admin/design_directories') }
      format.xml  { head :ok }
    end
  end

  def design_directories_image_remove
    @image = Image.find(params[:id])
    @design_directories = DesignDirectory.find(@image.design_directory_id)
    @image.destroy
    respond_to do |format|
      format.html { redirect_to('/admin/design_directory_images/'+@image.design_directory_id) }
      format.xml  { head :ok }
    end
  end

  def directory_user_activate
    @user = User.find(params[:id])
    flash[:notice] = "User #{@user.firstname} has been activated successfully."
    @user.update_attribute(:activate, 1)
    respond_to do |format|
      format.html { redirect_to('/admin/design_directories') }
      format.xml  { head :ok }
    end
  end

  def directory_user_deactivate
    @user = User.find(params[:id])
    flash[:notice] = "User #{@user.firstname} has been deactivated successfully."
    @user.update_attribute(:activate, 0)
    respond_to do |format|
      format.html { redirect_to('/admin/design_directories') }
      format.xml  { head :ok }
    end
  end

  def distroy_portfolio
    @portfolio = Portfolio.find(params[:id])
    unless @portfolio.nil? or @portfolio.blank? then
      unless @portfolio.user.nil? or @portfolio.user.blank? then

        @portfolio.user.destroy
        
        @portfolio.destroy
      end
    end
    respond_to do |format|
      format.html { redirect_to('/admin/portfolios') }
      format.xml  { head :ok }
    end
  end

  def distroy_job
    @jobs = Job.find(params[:id])
    unless @jobs.nil? or @jobs.blank? then
      @jobs.destroy
    end
    respond_to do |format|
      format.html { redirect_to('/admin/jobs') }
      format.xml  { head :ok }
    end
  end
  

   

  def portfolio_user_activate
    @user = User.find(params[:id])
    flash[:notice] = "User #{@user.firstname} has been activated successfully."
    @user.update_attribute(:activate, 1)
    respond_to do |format|
      format.html { redirect_to('/admin/portfolios') }
      format.xml  { head :ok }
    end
  end

  def portfolio_user_deactivate
    @user = User.find(params[:id])
    flash[:notice] = "User #{@user.firstname} has been deactivated successfully."
    @user.update_attribute(:activate, 0)
    respond_to do |format|
      format.html { redirect_to('/admin/portfolios') }
      format.xml  { head :ok }
    end
  end

   def jobs_activate
    @jobs = Job.find(params[:id])
    flash[:notice] = "Job #{@jobs.id} has been activated successfully."
    @jobs.update_attribute(:activate, 1)
    respond_to do |format|
      format.html { redirect_to('/admin/jobs') }
      format.xml  { head :ok }
    end
  end

   def jobs_deactivate
    @jobs = Job.find(params[:id])
    flash[:notice] = "Job #{@jobs.id} has been deactivated successfully."
    @jobs.update_attribute(:activate, 0)
    respond_to do |format|
      format.html { redirect_to('/admin/jobs') }
      format.xml  { head :ok }
    end
  end

end
