class WorkoutsController < ApplicationController
  before_action :set_workout, only: [:show, :edit, :update, :destroy]
  def index
    if params[:user_id]
      @workouts = User.find(params[:user_id]).workouts
      respond_to do |format|
        format.html
        format.pdf do
          render pdf: "Workouts_History_#{Date.today.strftime("%Y_%m_%d")}",
          page_size: 'A4',
          template: "workouts/index.pdf.erb",
          title: "Workouts_History_#{Date.today.strftime("%Y_%m_%d")}",
          locals: { :workouts => params[:workout].nil? ? @workouts : workouts_in_date_range }
        end
      end
    end
  end

  def show
  end

  def new
    @workout = User.find(params[:user_id]).workouts.new
  end

  def create
    user = current_user
    @workout = user.workouts.new(workout_params)
    #byebug
    if @workout.valid?
      @workout.save
    end
    redirect_to root_path, notice: 'Workout added successfully' # (current_user)
  end

  def edit
  end

  def update
    if @workout.update(workout_params)
      redirect_to root_path, notice: 'Workout updated succesfully'
    else
      render :edit
    end
  end

  def destroy
    if @workout.destroy
      redirect_to root_path, notice: 'Workout deleted successfully'
    else
      flash[:error] = @workout.errors.full_messages
    end
  end

  private

  def set_workout
    @workout = Workout.find(params[:id])
  end

  def workout_params
    params.require(:workout).permit(
        :id,
        :name,
        :description,
        #:date,
        :user_id,
        :number_of_exercises,
        exercises_attributes: [:name, :description, :sets, :reps, :weight, :_destroy]
    )
  end

  def workouts_in_date_range
    start_date = params[:workout][:start_date]
    end_date = params[:workout][:end_date]
    # if no date is sent, return all workouts
    if start_date.empty? || end_date.empty?
      workouts = current_user.workouts
      return workouts
    end
    workouts_in_range = []
    @workouts.each do |workout|
      workout_date = workout.created_at.strftime("%Y-%m-%d")
      if workout_date.between?(start_date, end_date)
        workouts_in_range << workout
      end
    end
    workouts_in_range
  end

end
