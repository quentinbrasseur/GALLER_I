class ArtworksController < ApplicationController

  def index
    @artworks = Artwork.where.not(latitude: nil, longitude: nil)
    @hash = Gmaps4rails.build_markers(@artworks) do |artwork, marker|
      marker.lat artwork.latitude
      marker.lng artwork.longitude
    end
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
    @hash = Gmaps4rails.build_markers(@artwork) do |artwork, marker|
      marker.lat artwork.latitude
      marker.lng artwork.longitude
    end
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


  def search
    @result = [ ]  #shows the results from the filter
    @search = Artwork.where( location: params[:city])
    city = params[:city]
    date = params[:date_range]
    date = date.split(%r{\s*-\s*})
    from = date[0].to_s
    to = date[1].to_s
    @from_request = Date.strptime(from, '%m/%d/%Y')
    @to_request = Date.strptime(to, '%m/%d/%Y')
    @search.all.map do |art|  #execute for all artwork instances
      booked = false  #defaults all artwork to 'unbooked'
      art.appointments.each do |appointment|
        (appointment.start_date.to_date..appointment.end_date.to_date).each do |date|
          booked = true if date.between?(@from_request   , @to_request )
        end
      end

      unless booked
        artwork = Artwork.new
        artwork.id = art.id
        artwork.title = art.title
        artwork.category = art.category
        artwork.location = art.location
        # artwork.artist = art.owner.email #change to name if you don't wamt email
        artwork.latitude = art.latitude
        artwork.longitude = art.longitude

        # artwork.photo = art.photo


        @result << artwork

      end

    end


      @hash = Gmaps4rails.build_markers(@result) do |art, marker|
        marker.lat art.latitude
        marker.lng art.longitude
      end
      @hash.pop

  end
  # @artworks = Artwork.where.not(latitude: nil, longitude: nil)
  #       @hash = Gmaps4rails.build_markers(@result) do |artwork, marker|
  #    marker.lat artwork.latitude
  #    marker.lng artwork.longitude
  #  end


def destroy
  @artwork = Artwork.find(params[:id])
  @artwork.destroy
  redirect_to artworks_path
end

private

def artwork_params
  params.require(:artwork).permit(:title, :category, :location, :height, :width, :depth, :weight, :photo)
end

end
