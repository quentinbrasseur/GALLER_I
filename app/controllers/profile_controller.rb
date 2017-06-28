class ProfileController < ApplicationController
  def show
    venue = current_user.venues
    @confirmed_appointments = Appointment.where(venue_id: venue, status: "Confirmed")
    @refused_appointments = Appointment.where(venue_id: venue, status: "Refused")
    @pending_appointments = Appointment.where(venue_id: venue, status: "Pending")
  end

  def edit
  end

  def update
  end
end
