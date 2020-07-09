class AppointmentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @appointments = User.find(params[:user_id]).appointments
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "Appointments_Resume_#{Date.today.strftime("%Y_%m_%d")}",
        page_size: 'A4',
        template: "appointments/index.pdf.erb",
        title: "Appointments_Resume_#{Date.today.strftime("%Y_%m_%d")}",
        locals: { :appointments => params[:appointment].nil? ? @appointments : appointments_in_date_range }
        #disposition: 'attachment' -> directly download without previz
      end
    end
  end

  def show
    @appointment = Appointment.find(params[:id])
  end

  def new
    @appointment = Appointment.new
    # prepopulate client_id field in form
    if current_user.type == 'Professional'
      if params[:client_id]
        @appointment = current_user.appointments.build(client_id: params[:client_id])
      else
        @appointment = Appointment.new
      end
    elsif current_user.type == 'Client'
      if params[:professional_id]
        @appointment = current_user.appointments.build(professional_id: params[:professional_id])
      else
        @appointment = Appointment.new
      end
    else
      @appointment = Appointment.new
    end
  end
  
  def create
    @appointment = current_user.appointments.new(appointment_params)
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
    @appointment = Appointment.find(params[:id])
    if @appointment.destroy
      redirect_to user_appointments_path(params[:user_id]), notice: 'Appointment deleted successfully'
    else
      flash[:error] = @appointment.errors.full_messages
      redirect_to user_appointment_path(params[:user_id])
    end
  end

  def delete_all
    if current_user.appointments.delete_all
      redirect_to user_appointments_path(current_user), notice: 'All appointments deleted successfully'
    else
      redirect_to user_appointments_path(current_user), flash[:error] = 'Something went wrong while deleting appointments'
    end
  end

  private

  def appointment_params
    params.require(:appointment).permit(
      :id,
      :title,
      :user_id,
      :description,
      :client_id,
      :professional_id,
      :start_time
    )
  end

  def appointments_in_date_range
    start_date = params[:appointment][:start_date]
    end_date = params[:appointment][:end_date]
    # byebug
    # if start_date or end_date are empty (or both), return all appointments
    if start_date.empty?
      appointments = current_user.appointments
      return appointments
    elsif end_date.empty?
      appointments = current_user.appointments
      return appointments
    end
    appointments_in_range = []
    @appointments.each do |appointment|
      appointment_date = appointment.created_at.strftime("%Y-%m-%d")
      if appointment_date.between?(start_date, end_date)
        appointments_in_range << appointment
      end
    end
    appointments_in_range
  end

end