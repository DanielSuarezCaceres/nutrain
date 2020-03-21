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
    @user = User.find(params[:user_id])
    @workout = @user.workouts.new(workout_params)
    if @workout.valid?
      @workout.save
    end
    redirect_to root_path
  end

  def edit
  end

  def update
  end

  def destroy
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
        :date,
        :user_id,
        exercises_attributes: [:name, :description, :sets, :reps, :weight, :_destroy]
    )
  end
end
