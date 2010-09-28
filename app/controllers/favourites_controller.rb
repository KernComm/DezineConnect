class FavouritesController < ApplicationController
  # GET /favourites
  # GET /favourites.xml
  def index
    @favourites = Favourite.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @favourites }
    end
  end

  # GET /favourites/1
  # GET /favourites/1.xml
  def show
    @favourite = Favourite.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @favourite }
    end
  end

  # GET /favourites/new
  # GET /favourites/new.xml
  def new
    @favourite = Favourite.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @favourite }
    end
  end

  # GET /favourites/1/edit
  def edit
    @favourite = Favourite.find(params[:id])
  end

  # POST /favourites
  # POST /favourites.xml
  def create

    @favourite_details = Hash.new

    @favourite_details[:user_id] = params[:user_id]
    @favourite_details[:job_posting_id] = params[:job_posting_id]
    @favourite_details[:status_flag] = params[:status_flag]
    @favourite = Favourite.new(@favourite_details)

    respond_to do |format|
      if @favourite.save
        flash[:notice] = 'Favourite was successfully created.'
        format.html { redirect_to(@favourite) }
        format.xml  { render :xml => @favourite, :status => :created, :location => @favourite }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @favourite.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /favourites/1
  # PUT /favourites/1.xml
  def update
    @favourite = Favourite.find(params[:id])

    respond_to do |format|
      if @favourite.update_attributes(params[:favourite])
        flash[:notice] = 'Favourite was successfully updated.'
        format.html { redirect_to(@favourite) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @favourite.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /favourites/1
  # DELETE /favourites/1.xml
  def destroy
    @favourite = Favourite.find(params[:id])
    @favourite.destroy

    respond_to do |format|
      format.html { redirect_to(favourites_url) }
      format.xml  { head :ok }
    end
  end
end
