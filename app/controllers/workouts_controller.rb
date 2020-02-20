class WorkoutsController < ApplicationController
  #before_action :set_workout, only: [:show :edit :update :destroy]
  def index
    if params[:user_id]
      @workouts = User.find(params[:user_id]).workouts
    end
  end

  def show
  end

  def new
    @workout = Workout.new
  end

  def create
    @workout = Workout.new(workout_params)
    if @workout.valid?
      @workout.save
    end
    redirect_to workout_path
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def workout_params
    params.require(:workout).permit(
        :id,
        :name,
        :description,
        :date,
        :user_id,
    )
  end

  def set_workout
    @workout = Workout.find(params[:id])
  end
end
