class ImagesController < ApplicationController
  require 'paperclip'
  # GET /images
  # GET /images.xml
  def index
    @images = Image.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @images }
    end
  end

  # GET /images/1
  # GET /images/1.xml
  def show
    @image = Image.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @image }
    end
  end

  # GET /images/new
  # GET /images/new.xml
  def new
    @image = Image.new
    
    render :layout => false
  end

  # GET /images/1/edit
  def edit
    @image = Image.find(params[:id])
  end

  # POST /images
  # POST /images.xml
  def create
    count_var = 0

    @image = Image.new
    @image.image = params[:Filedata]
    unless params[:portfolio_id].nil? or params[:portfolio_id].blank? then
      @image.portfolio_id = params[:portfolio_id]
      @image.save

      @portfolio = Portfolio.find_by_id(params[:portfolio_id])
      @image_count = @portfolio.images.count
      # Image.portfolios.count(:conditions => "portfolio_id = #{params[:portfolio_id]}")
      logger.info " @image_count : #{@image_count} "
      #@button_display = 1
      @button_display = 1
      render :template => "images/display_thumbnail", :locals => {:image => @image, :button_display => @button_display}
    else
      @image.design_directory_id = params[:design_directory_id]
      @image.save

      @design_directory = DesignDirectory.find_by_id(params[:design_directory_id])
      @image_count = @design_directory.images.count
      
      logger.info " @image_count : #{@image_count} "
      #@button_display = 1
      @button_display = 1
      render :template => "images/display_thumbnail", :locals => {:image => @image, :button_display => @button_display}
      
    end
  end

  # PUT /images/1
  # PUT /images/1.xml
  def update
    @image = Image.find(params[:id])

    respond_to do |format|
      if @image.update_attributes(params[:image])
        flash[:notice] = 'Image was successfully updated.'
        format.html { redirect_to(@image) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @image.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /images/1
  # DELETE /images/1.xml
  def remove
    
    @image = Image.find(params[:id])
    @portfolio = Portfolio.find(@image.portfolio_id)
    @image.destroy

    respond_to do |format|
      format.html { redirect_to("/portfolios/edit_portfolio/#{@portfolio.id}") }
      format.xml  { head :ok }
    end
  end

  def display_thumbnail
    render :layout => false
  end

  def delete_image
    @image = Image.new(params[:id])
    logger.info "@image : #{@image.inspect}"
  end

end
