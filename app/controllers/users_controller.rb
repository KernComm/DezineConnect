class UsersController < ApplicationController
  # GET /users
  # GET /users.xml
  def index
    @users = User.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end
  # GET /users/1
  # GET /users/1.xml
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    directory_listing = params[:directory]
    session[:directory_listing_obj] = directory_listing
    @title = "Register"
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/1/edit
  def edit
    @title = "Edit - Account Settings"
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.xml
  def create

    @user = User.new(params[:user])
    @user.activation_key = ActiveSupport::SecureRandom.hex(4)
    @user_status = User.find_by_email(params[:user][:email])

    unless @user_status.nil? or @user_status.blank? then
      respond_to do |format|
        flash[:notice] = 'this email is already registed with us. please <a href="/login" id="login_link">login</a>'
        unless session[:directory_listing_obj].nil? or session[:directory_listing_obj].blank? then
	  format.html { redirect_to("/users/new?directory=FreeListing") }
	else
	  format.html { redirect_to("/users/new") }
        end
      end
    else

      logger.info "@user_status : #{@user_status.inspect}"
      respond_to do |format|
        if @user.save
          session[:registered_user_id] = @user.id
          unless session[:directory_listing_obj].nil? or session[:directory_listing_obj].blank? then
            format.html { redirect_to("/design_directories/new") }
          else
            format.html { redirect_to("/portfolios/new") }
          end

          
          format.xml  { render :xml => @user, :status => :created, :location => @user }
        else
          format.html { render :action => "new" }
          format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
        end
      end
      
    end
  end

  def login
    logger.info "params[:login] : #{params[:login]} #{params[:password]}"
    unless params[:login].nil? and params[:password].nil? then
      if params[:login]=="admin@dezineconnect.com" and params[:password]=="teamdezineconnect2010$%^" then
        session[:is_admin] = true
        redirect_to '/admin/portfolios'
      elsif params[:login]=="team@dezineconnect.com" and params[:password]=="kern123" then
        @user = User.find_by_email(params[:login])
	unless @user.nil? then
	logger.info "@user.password : #{@user.password}}"
	if @user.password == params[:password] then
	 session[:loggedin_user] = @user.id
         session[:is_dezineconnect_team] = true
	 redirect_to '/jobs/dashboard'
	end
        end
      else
        @user = User.find_by_email(params[:login])
        unless @user.nil? then
          logger.info "@user.password : #{@user.password}}"
          if @user.password == params[:password] then
            session[:loggedin_user] = @user.id
            unless @user.portfolio.nil? or @user.portfolio.blank? then
              @images = Image.find_by_portfolio_id(@user.portfolio.id)
              unless @images.nil? or @images.blank? then
                redirect_to "/portfolios"
              else
                session[:registered_user_id] = @user.id
                session[:existing_portfolio_id] = @user.portfolio.id
                redirect_to "/portfolios/create"
              end
              
            else
              unless @user.design_directory.nil? or @user.design_directory.blank? then
                @images = Image.find_by_design_directory_id(@user.design_directory.id)
                unless @images.nil? or @images.blank? then
                  redirect_to "/design_directories"
                else
                  session[:registered_user_id] = @user.id
                  session[:existing_design_directory_id] = @user.design_directory.id
                  redirect_to "/design_directories/show/#{session[:existing_design_directory_id]}"
                end

              else
                session[:registered_user_id] = @user.id
                redirect_to "/portfolios/new"
              end
              
            end
          else
            flash[:flash19] = "the username or password you entered is incorrect."
            redirect_to "/login"
	          end     
        else
          flash[:flash20] = "the username or password you entered is incorrect."
          redirect_to "/login"
        end
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find(params[:id])
    logger.info "@user : #{@user.inspect}"
    logger.info "params[:user] : #{params[:user].inspect}"
    #"new_password"=>"", "user"=>{"lastname"=>"aaramu", "firstname"=>"Sumindfsd", "password"=>""}

    if @user.password != params[:user][:password] then
      if params[:user][:password] == "" then
      else
        #when current password and new password are not empty
        flash[:notice1] = 'current password does not match with exisitng password'
      end
      
    elsif (@user.password == params[:user][:password]) and params[:new_password].blank? then
      flash[:notice2] = 'new password is blank.'
    elsif params[:new_password] == params[:user][:password] then
      flash[:notice3] = 'current and new passwords are same.'
    elsif ((@user.password == params[:user][:password]) and (params[:new_password] != params[:user][:password]))
      @user.update_attribute(:firstname, params[:user][:firstname])
      @user.update_attribute(:lastname, params[:user][:lastname])
      @user.update_attribute(:password, params[:new_password])
    elsif (params[:user][:password].blank?) then
        
      @user.update_attribute(:firstname, params[:user][:firstname])
      @user.update_attribute(:lastname, params[:user][:lastname])
      flash[:notice4] = 'Password has been changed successfully.'
      
    end
   
    redirect_to("/users/edit/#{@user.id}")
    
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end

  def delete_account
    @user = User.find(params[:id])
  end

  def logout
    reset_session
    redirect_to "/portfolios"
  end

  def activate
    @user = User.find_by_activation_key(params[:id])
    @user.update_attribute(:activate, 1)
    session[:user_activated_to_show_page] = true
    session[:loggedin_user] = @user.id
    unless @user.portfolio.nil? or @user.portfolio.blank? then
      redirect_to "/portfolios/show/#{@user.portfolio.id}"
    else
      redirect_to "/design_directories/show/#{@user.design_directory.id}"
    end
  end

  def forgot
    @user = User.find_by_email(params[:login])
    unless @user.nil? then
      redirect_to "/portfolios/forgot_confirmation"
      UserMailer.deliver_forgot_password(@user)
    end
  end

  def forgot_confirmation
    
  end
  
end
