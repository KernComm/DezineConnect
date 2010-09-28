class BlogsController < ApplicationController
  
  # GET /blogs
  # GET /blogs.xml
  def index
    @title = "Designers & Creative People from India"
    @blogs = Blog.find(:all, :order => "created_at DESC") 
    respond_to do |format|
      format.html #index.html.erb
      format.xml  { render :xml => @blogs }
      format.rss  { render :layout=>false}
    end
  end

  # GET /blogs/1
  # GET /blogs/1.xml
  def show
    @blog = Blog.find(params[:id])
    if @blog.page_views.nil? then
      @blog.update_attribute(:page_views, 1)
    else
      @blog.update_attribute(:page_views, @blog.page_views.to_i+1)
    end

    @title = @blog.blog_statement
    @name = @blog.name
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @blog }
    end
  end

  def preview
    @blog = Blog.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @blog }
    end
  end

  # GET /blogs/new
  # GET /blogs/new.xml
  def new
    @blog = Blog.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @blog }
    end
  end



  # POST /blogs
  # POST /blogs.xml
  def create
    @blog = Blog.new(params[:blog])
  
   

    respond_to do |format|
      if @blog.save
        flash[:notice] = 'Blog was successfully created.'

         session[:blog_id] = @blog.id
        
        format.html { redirect_to "/blogs/preview/#{@blog.id}" }
        format.xml  { render :xml => @blog, :status => :created, :location => @blog }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @blog.errors, :status => :unprocessable_entity }
      end
    end
  end

 
  # PUT /blogs/1
  # PUT /blogs/1.xml
  def update
    @blog = Blog.find(params[:id])

    respond_to do |format|
      if @blog.update_attributes(params[:blog])
        flash[:notice] = 'Blog was successfully updated.'
        format.html { redirect_to(@blog) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @blog.errors, :status => :unprocessable_entity }
      end
    end
  end

  def edit
    @blog = Blog.find(params[:id])
  end
  
  # DELETE /blogs/1
  # DELETE /blogs/1.xml
  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy

    respond_to do |format|
      format.html { redirect_to(blogs_url) }
      format.xml  { head :ok }
    end
  end

  def about
    
  end

  def blank
    
  end

  def legal
    
  end

  def process_file_uploads(task)
    i = 0
    while params[:attachment]['file_'+i.to_s] != "" && !params[:attachment]['file_'+i.to_s].nil?
      task.assets.build(:data => params[:attachment]['file_'+i.to_s])
      i += 1
    end
  end

  
end
