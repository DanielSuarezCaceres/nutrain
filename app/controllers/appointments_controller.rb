class AppointmentsController < ApplicationController

  def index
    @appointments = User.find(params[:user_id]).appointments
  end

  def show
    @appointment = appointment.find(params[:id])
  end

  def new
    @appointment = appointment.new
  end
  
  def create
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
      :user_id,
    )
  end  

end
