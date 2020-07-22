class MeasurementsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_measurement, only: [:show, :edit, :update, :destroy]

  # GET /measurements
  def index
    if params[:user_id]
      @q = User.find(current_user.id).measurements.ransack(params[:q])
      @pagy, @measurements = pagy(@q.result)
      respond_to do |format|
        format.html
        format.pdf do
          render pdf: "Measurements_History_#{Date.today.strftime("%Y_%m_%d")}",
          page_size: 'A4',
          template: "measurements/index.pdf.erb",
          title: "Measurements_History_#{Date.today.strftime("%Y_%m_%d")}",
          locals: { :measurements => params[:measurement].nil? ? @measurements : measurements_in_date_range }
          #disposition: 'attachment' -> directly download without previz
        end
      end
    end
  end

  # GET /measurements/1
  def show
  end

  # GET /measurements/new
  def new
    @measurement = User.find(params[:user_id]).measurements.new
  end

  # GET /measurements/1/edit
  def edit
  end

  # POST /measurements
  def create
    @measurement = User.find(params[:user_id]).measurements.new(measurement_params)
    if @measurement.valid?
      @measurement.save
      redirect_to user_measurements_path(current_user), notice: 'Body measurements added sucessfully'
    else
      render :new
    end
  end

  # PATCH/PUT /measurements/1
  def update
    if @measurement.update(measurement_params)
      redirect_to user_measurements_path(params[:user_id]), notice: 'Body measurements updated sucessfully'
    else
      render :edit
    end
  end

  # DELETE /measurements/1
  def destroy
    if @measurement.destroy
      redirect_to user_measurements_path(params[:user_id]), notice: 'Body measurements deleted successfully'
    else
      redirect_to user_measurements_path(current_user),
        :flash => { :error => "Something went wrong while deleting measurement" }
    end
  end

  def delete_all
    if current_user.measurements.any?
      if current_user.measurements.delete_all
        redirect_to user_measurements_path(current_user), notice: 'All measurements deleted successfully'
      else
        redirect_to user_measurements_path(current_user),
          :flash => { :error => "Something went wrong while deleting measurements" }
      end
    else
      redirect_to user_measurements_path(current_user),
        :flash => { :error => "No measurements to delete" }
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def measurement_params
      params.require(:measurement).permit(
        :id,
        :day,
        :weight,
        :body_fat,
        :neck_size,
        :chest_size,
        :arm_size,
        :waist_size,
        :hips_size,
        :leg_size
      )
    end
     # Use callbacks to share common setup or constraints between actions.
    def set_measurement
      @measurement = Measurement.find(params[:id])
    end

    def measurements_in_date_range
      # byebug
      start_date = params[:measurement][:start_date]
      end_date = params[:measurement][:end_date]
      # if start_date or end_date are empty (or both), return all meals
      # need to check why if in a single line doesn't work
      if start_date.empty?
        measurements = current_user.measurements
        return measurements
      elsif end_date.empty?
        measurements = current_user.measurements
        return measurements
      end
      measurements_in_range = []
      current_user.measurements.each do |measurement|
        measurement_date = measurement.day.strftime("%Y-%m-%d")
        # byebug
        if measurement_date.between?(start_date, end_date)
          measurements_in_range << measurement
        end
      end
      # byebug
      measurements_in_range
    end
end
