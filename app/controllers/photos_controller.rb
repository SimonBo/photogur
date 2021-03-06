class PhotosController < ApplicationController
  def index
    @photos = Photo.all
    @most_recent_photos = Photo.most_recent_five

  end

  def show
    @photo = Photo.find(params[:id])
  end

  def new
    @photo = Photo.new
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def update
    @photo = Photo.find(params[:id])

    if @photo.update_attributes(photo_params)
      redirect_to photo_path(@photo)
    else
      render :edit
    end
  end

  def create
    @photo = Photo.new(photo_params)
    if @photo.save
      redirect_to photo_path(@photo)
    else
      render :new
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.delete
    redirect_to photos_path
  end

  private

  def photo_params
    params.require(:photo).permit(:title, :url, :author)
  end
end
