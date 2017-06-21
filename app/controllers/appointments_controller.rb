class AppointmentsController < ApplicationController
  def index
    @appointments = Appointment.all #all appts for current user
  end

  def show
    @appointment = Appointment.find(params[:id])

  end

  def new
    @artwork = Artwork.find(params[:artwork_id])
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

      @appointment.save
      redirect_to appointment_path(@appointment)
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
  redirect_to appointments_path
end

def confirm
  appointment = Appointment.find(params[:appointment_id])
  appointment.status = "Confirmed"
  redirect_to appointments_path
end

def decline
  appointment = Appointment.find(params[:appointment_id])
  appointment.status = "Declined"
  redirect_to appointments_path

end


private

def appointment_params
  params.require(:appointment).permit(:start_date, :end_date)
end

end
