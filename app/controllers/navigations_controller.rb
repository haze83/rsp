class NavigationsController < ApplicationController
  # GET /navigations
  # GET /navigations.json
  def index
    @navigations = Navigation.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @navigations }
    end
  end

  # GET /navigations/1
  # GET /navigations/1.json
  def show
    @navigation = Navigation.find(params[:id])
    flash.now[:notice] = "no articles for this navigation" if @navigation.articles.size == 0

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @navigation }
    end
  end

  # GET /navigations/new
  # GET /navigations/new.json
  def new
    @navigation = Navigation.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @navigation }
    end
  end

  # GET /navigations/1/edit
  def edit
    @navigation = Navigation.find(params[:id])
  end

  # POST /navigations
  # POST /navigations.json
  def create
    @navigation = Navigation.new(params[:navigation])

    respond_to do |format|
      if @navigation.save
        format.html { redirect_to @navigation, notice: 'Navigation was successfully created.' }
        format.json { render json: @navigation, status: :created, location: @navigation }
      else
        format.html { render action: "new" }
        format.json { render json: @navigation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /navigations/1
  # PUT /navigations/1.json
  def update
    @navigation = Navigation.find(params[:id])

    respond_to do |format|
      if @navigation.update_attributes(params[:navigation])
        format.html { redirect_to @navigation, notice: 'Navigation was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @navigation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /navigations/1
  # DELETE /navigations/1.json
  def destroy
    @navigation = Navigation.find(params[:id])
    @navigation.destroy

    respond_to do |format|
      format.html { redirect_to navigations_url }
      format.json { head :ok }
    end
  end
end
