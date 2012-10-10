class UploadsController < ApplicationController
  def index
    @upload = Upload.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @upload }
    end
  end
  
  def new
    @upload = Upload.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @upload }
    end
  end
  
  def show
    @upload = Upload.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @article }
    end
  end
  def create
    @upload = Upload.new(params[:upload])
    
    respond_to do |format|
      if @upload.save
        format.html { redirect_to @upload, notice: "File has been uploaded successfully" }
        format.json { render json: @upload, status: :created, location: @upload }
      else
        format.html { render action: "new" }
        format.json { render json: @upload.errors, status: :unprocessable_entity }
      end
    end
  end
end
