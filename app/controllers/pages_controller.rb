class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def profile
    @my_appointments = current_user.appointments
    @my_venues = current_user.venues
    @my_artworks = current_user.artworks
  end

end
