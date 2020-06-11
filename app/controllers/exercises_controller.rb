class ExercisesController < ApplicationController
  
  def index
    #@ = .scoped
    @exercises = Exercise.all
    if params[:workout_id]
      @exercises = Workout.find(params[:workout_id]).exercises
    end
    if params[:user_id]
      @exercises = User.find(params[:user_id]).get_all_exercises
    end
  end

  def show
  end

  def new
    @exercise = curent_user.exercises.new
  end

  def create
    @exercise = current_user.exercises.new(exercise_params)
    if @exercise.valid?
      @exercise.save
    end
    redirect_to exercise_path
  end

  def update
    @exercise = Exercise.find(params[:id])
    if @exercise.update(exercise_params)
      redirect_to root_path(current_user)
    else
      flash[:error] = @exercise.errors
    end
  end

  def edit
    @exercise = Exercise.find(params[:id])
  end

  def destroy
  end

  private

  def exercise_params
    params.require(:exercise).permit(
        :id,
        :name,
        :description,
        :sets,
        :reps,
        :weight,
        :file,
        :workout_id,
        #:user_id
    )
  end

  def set_exercise
    @exercise = Exercise.find(params[:id])
  end

end
