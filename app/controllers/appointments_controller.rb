class AppointmentsController < ApplicationController
  def index
    @appointments = Appointment.all #all appts for current user
  end

  def show
    @appointment = Appointment.find(params[:id])
  end

  def new
     # @artwork = Artwork.find(params[:artwork_id])
     # @appointment = Appointment.new
  end

  def create
  #   @artwork = Artwork.find(params[:artwork_id])
  #   @appointment = Appointment.new(appointment_params)
  #   @appointment.artwork = @artwork
  #   @appointment.user = current_user
  # @appointment.start_date = DateTime.strptime(appointment_params[:start_date], '%m/%d/%Y')
  #   @appointment.end_date = DateTime.strptime(appointment_params[:end_date], '%m/%d/%Y')

  #   @appointment.save
  #   if @appointment.save
  #     redirect_to appointment_path(@appointment)
  #   else
  #     render :new
  #   end
  # end

  end

  def edit
    # @appointment = Appointment.find(params[:id])
  end

  def update
    # @appointment = Appointment.find(params[:id])
    # @appointment.update(appointment_params)
    # @appointment.start_date = DateTime.strptime(appointment_params[:start_date], '%m/%d/%Y')
    # @appointment.end_date = DateTime.strptime(appointment_params[:end_date], '%m/%d/%Y')
    # @appointment.save
    # redirect_to appointment_path(@appointment)
  end

  def destroy
    @appointment = Appointment.find(params[:id])
    @appointment.destroy
    redirect_to appointments_path
  end
def appointment_params
    params.require(:appointment).permit(:start_date, :end_date)
  end
end
