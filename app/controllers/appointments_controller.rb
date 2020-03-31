class AppointmentsController < ApplicationController

  def index
    @appointments = User.find(params[:user_id]).appointments
  end

  def show
    @appointment = Appointment.find(params[:id])
  end

  def new
    #byebug
    @appointment = Appointment.new
  end
  
  def create
    #byebug
    @user = User.find(params[:user_id])
    @appointment = @user.appointments.new(appointment_params)
    byebug
    @appointment.update(start_time: appointment_params[:start_time].to_time)
    @appointment.update(end_time: appointment_params[:end_time].to_time)
    byebug
    if @appointment.valid?
      @appointment.save
    end
    redirect_to user_appointments_path  
  end

  def update
    #@ = .find(params[:id])
  end

  def edit
    #@ = .find(params[:id])
  end

  def destroy
    #@ = .find(params[:id])
  end

  private

  def appointment_params
    params.require(:appointment).permit(
      :id,
      :name,
      :description,
      :client_id,
      :professional_id,
      :start_time,
      :end_time
    )
  end  

end
