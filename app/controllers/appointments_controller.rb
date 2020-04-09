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
    # esta asignacion no deberia tener que hacerla, buscar solucion
    # params[:user_id] = current_user.id
    #@user = User.find(params[:user_id])
    @appointment = current_user.appointments.new(appointment_params)
    #byebug
    @appointment.update(start_time: appointment_params[:start_time].to_time)
    @appointment.update(end_time: appointment_params[:end_time].to_time)
    #byebug
    if @appointment.valid?
      @appointment.save
      flash[:notice] = 'Appointment created sucessfully'
      redirect_to user_appointments_path(current_user)
    else
      flash[:error] = @appointment.errors
      render :new
    end
  end

  def update
    @appointment = Appointment.find(params[:id])
    #byebug
    if @appointment.update(appointment_params)
      flash[:notice] = 'Appointment updated succesfully'
      redirect_to user_appointments_path(user_id: current_user.id)
    else
      flash[:error] = @appointment.errors
      render :edit
    end
  end

  def edit
    @appointment = Appointment.find(params[:id])
  end

  def destroy
    #@ = .find(params[:id])
  end

  private

  def appointment_params
    params.require(:appointment).permit(
      :id,
      :title,
      :description,
      :client_id,
      :professional_id,
      :start_time,
      :end_time
    )
  end  

end
