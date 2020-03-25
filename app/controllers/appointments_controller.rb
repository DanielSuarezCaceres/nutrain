class AppointmentsController < ApplicationController

  def index
    @appointments = User.find(params[:user_id]).appointments
  end

  def show
    @appointment = Appointment.find(params[:id])
  end

  def new
    byebug
    @appointment = Appointment.new
  end
  
  def create
    byebug
    @user = User.find(params[:user_id])
    @appointment = @user.appointments.new(appointment_params)
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
      :start_date,
      :end_date
    )
  end  

end
