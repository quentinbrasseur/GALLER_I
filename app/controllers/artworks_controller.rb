class ArtworksController < ApplicationController

def index
  @artworks = Artwork.all
end

def new
  @artwork = Artwork.new
end

def create
  @artwork = Artwork.new(artwork_params)
  @artwork.owner = current_user
  if @artwork.save
    redirect_to artwork_path(@artwork)
  else
    render :new
  end
end

def show
  @artwork = Artwork.find(params[:id])
end

def edit
  @artwork = Artwork.find(params[:id])
end

def update
  @artwork = Artwork.find(params[:id])
  if @artwork.update(artwork_params)
    redirect_to artwork_path(@artwork)
  else
    render :edit
  end
end

def destroy
  @artwork = Artwork.find(params[:id])
  @artwork.destroy
  redirect_to artworks_path
end

private

def artwork_params
  params.require(:artwork).permit(:title, :category, :location, :height, :width, :depth, :weight)
end

end
