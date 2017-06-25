class AppointmentsController < ApplicationController
  def index
    @appointments = Appointment.all #all appts for current user
  end

  def show
    @appointment = Appointment.find(params[:id])
  end

  def new
    @artwork = Artwork.find(params[:artwork_id])
    @status = Appointment.where(artwork_id: @artwork.id)
    @disabled_days = []
    @status.each do |appt|
      (((appt.start_date))..((appt.end_date))).each do |date|
        @disabled_days << date
      end
    end
    @appointment = Appointment.new
  end

  def create
    venue = Venue.find(params[:venue_id])
    #if venue.employee?(current_user)
      @artwork = Artwork.find(params[:artwork_id])
      @appointment = Appointment.new(appointment_params)
      @appointment.artwork = @artwork
      @appointment.venue = venue
      # @appointment.user = current_user  #this needs to represent the user and the venue
      @appointment.start_date = DateTime.strptime(appointment_params[:start_date], '%m/%d/%Y')
      @appointment.end_date = DateTime.strptime(appointment_params[:end_date], '%m/%d/%Y')
      #####################Below-> Trying to validate uniqueness of each booked day
      # @reservations = Appointment.all
      # @reservations.each do |appointment|
      #     (appointment.start_date.to_date..appointment.end_date.to_date).each do |date|
      #       booked = true if date.between?(@from_request   , @to_request )
      #     end
      #   end

      @appointment.save

      redirect_to send_mailer_conversation_path(@appointment.artwork.owner)
    # else
    # redirect_to :root_path
    # end
  end

  def edit
    # @artwork = Artwork.find(params[:artwork_id])
    @appointment = Appointment.find(params[:id])
  end

  def update
    # @artwork = Artwork.find(params[:artwork_id])
    @appointment = Appointment.find(params[:id])
    @appointment.update(appointment_params)
    @appointment.start_date = DateTime.strptime(appointment_params[:start_date], '%m/%d/%Y')
    @appointment.end_date = DateTime.strptime(appointment_params[:end_date], '%m/%d/%Y')
    @appointment.save
    redirect_to appointment_path(@appointment)
  end

  def destroy
    @appointment = Appointment.find(params[:id])
    @appointment.destroy
    redirect_to profile_path(@appointment.venue.employees.ids)
  end

  def confirm #emails the requester that appt is confirmed
    appointment = Appointment.find(params[:appointment_id])
    appointment.status = "Confirmed"
    appointment.save
    redirect_to accepted_conversation_path(appointment.venue.employees.ids) ###create routes and methods
  end

  def decline #emails the requester that appt is declined
    appointment = Appointment.find(params[:appointment_id])
    appointment.status = "Declined"
    appointment.save
    redirect_to declined_conversation_path(appointment.venue.employees.ids) ### create routes and methods
  end

  private

  def appointment_params
    params.require(:appointment).permit(:start_date, :end_date)
  end

end
