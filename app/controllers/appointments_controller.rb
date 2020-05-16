class AppointmentsController < ApplicationController

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
  end
  
  def create
    # esta asignacion no deberia tener que hacerla, buscar solucion
    # params[:user_id] = current_user.id
    #@user = User.find(params[:user_id])
    @appointment = current_user.appointments.new(appointment_params)
    #byebug
    #@appointment.update(start_time: appointment_params[:start_time].to_time)
    #@appointment.update(end_time: appointment_params[:end_time].to_time)
    byebug
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