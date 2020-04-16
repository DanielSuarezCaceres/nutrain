class WorkoutsController < ApplicationController
  before_action :set_workout, only: [:show, :edit, :update, :destroy]
  def index
    if params[:user_id]
      @workouts = User.find(params[:user_id]).workouts
    end
  end

  def show
  end

  def new
    @workout = User.find(params[:user_id]).workouts.new
  end

  def create
    user = current_user
    # @user = User.find(params[:user_id])
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
end
