class ExercisesController < ApplicationController
  include Pagy::Backend

  before_action :authenticate_user!
  before_action :set_exercise, only: [:show, :edit, :update, :destroy]
  
  def index
    #@ = .scoped
    @pagy, @exercises = pagy(Exercise.all)
    if params[:workout_id]
      @pagy, @exercises = pagy(Workout.find(params[:workout_id]).exercises)
    end
    if params[:user_id]
      # @pagy, @exercises = pagy(User.find(params[:user_id]).get_all_exercises)
      # TODO: pagy has problems with array returned by get_all_exercises
      #@exercises = User.find(params[:user_id]).get_all_exercises
      @pagy, @exercises = pagy(Exercise.user_exercises(current_user.id), outset: 100)

    end
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "Exercises_#{Date.today.strftime("%Y_%m_%d")}",
        page_size: 'A4',
        template: "exercises/index.pdf.erb",
        title: "Exercises_#{Date.today.strftime("%Y_%m_%d")}",
        locals: { :exercises => @exercises }
        #disposition: 'attachment' -> directly download without previz
      end
     end
  end

  def show
  end

  def new
    @exercise = Exercise.new
  end

  def create
    @exercise = Exercise.new(exercise_params)
    if @exercise.valid?
      @exercise.save
      redirect_to user_exercises_path(current_user), notice: 'Exercise created successfully'
    else
      render :new
    end
  end

  def update
    if @exercise.update(exercise_params)
      redirect_to user_exercises_path(current_user), notice: 'Exercise updated successfully'
    else
      render :edit
    end
  end

  def edit
  end

  def destroy
    if @exercise.destroy
      redirect_to user_exercises_path(current_user), notice: 'Exercise deleted successfully'
    else
      redirect_to user_exercises_path(current_user),
      :flash => { :error => "Something went wrong while deleting exercise" }
    end
  end

  def delete_all
    @exercises = Exercise.user_exercises(current_user.id)
    if @exercises.any?
      @exercises.each do |ex|
        if Exercise.find(ex.id).destroy
          next
        else
          redirect_to user_exercises_path(current_user),
            :flash => { :error => "Sometehing went wrong while deleting exercises. You might have lost some of them" }
        end
      end
      redirect_to user_exercises_path(current_user), notice: 'All exercises deleted successfully'
    else
      redirect_to user_exercises_path(current_user),
        :flash => { :error => "No exercises to delete" }
    end
  end

  #make Pagy works well with arrays
  def pagy_get_items(collection, pagy)
    # handle arrays
    return collection[pagy.offset, pagy.items] if collection.is_a? Array
    # this should work with ActiveRecord, Sequel, Mongoid...
    collection.offset(pagy.offset).limit(pagy.items)
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
        :workout_id,
        :user_id
    )
  end

  def set_exercise
    @exercise = Exercise.find(params[:id])
  end

end
