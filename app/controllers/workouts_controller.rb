class WorkoutsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_workout, only: [:show, :edit, :update, :destroy]
  
  def index
    if params[:user_id]
      @q = User.find(params[:user_id]).workouts.ransack(params[:q])
      @pagy, @workouts = pagy(@q.result)
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
    if @workout.valid?
      @workout.save
      redirect_to root_path, notice: 'Workout added successfully' # (current_user)
    else
      render :new
    end
  end

  def edit
  end

  def update
    # update_exercises
    # byebug
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
      redirect_to user_workouts_path(current_user), :flash => { :error => "Something went wrong while deleting workout" }
    end
  end
  
  def delete_all
    if current_user.workouts.any?
      @exercises = Exercise.user_exercises(current_user.id)
      if @exercises.any?
        @exercises.each do |ex|
          if Exercise.find(ex.id).destroy
            next
          else
            redirect_to user_workouts_path(current_user),
              :flash => { :error => "Sometehing went wrong while deleting exercises. You might have lost some of them" }
          end
        end
      end
      if current_user.workouts.delete_all
        redirect_to user_workouts_path(current_user), notice: 'All workouts deleted successfully'
      else
        redirect_to user_workouts_path(current_user),
          :flash => { :error => "Something went wrong while deleting workouts" }
      end
    else
      redirect_to user_workouts_path(current_user),
        :flash => { :error => "No workouts to delete" }
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
        :day,
        :user_id,
        :number_of_exercises,
        :goal,
        exercises_attributes: %i[id name description sets reps weight _destroy],
    )
  end

  def update_exercises
    selected_exercises_ids = params[:workout][:exercise_ids]
    params[:workout][:exercises_attributes].each do |key, value|
      byebug
      if value["id"].nil?
        next
      else
        # byebug
        params[:workout][:exercises_attributes].delete(key) unless selected_exercises_ids.include? value["id"]
      end
    end
    byebug
    aux = true
  end

  def workouts_in_date_range
    start_date = params[:workout][:start_date]
    end_date = params[:workout][:end_date]
    # if start_date or end_date are empty (or both), return all workouts
    if start_date.empty?
      workouts = current_user.workouts
      return workouts
    elsif end_date.empty?
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
