class PhysioExercisesController < ApplicationController
  before_action :set_physio_exercise, only: [:show, :edit, :update, :destroy]

  # GET /physio_exercises
  def index
    if params[:client_id]
      @physio_exercises = User.find(params[:client_id]).physio_exercises
    else
      @physio_exercises = User.find(params[:user_id]).physio_exercises
      respond_to do |format|
        format.html
        format.pdf do
          render pdf: "Physio_Exercises_History_#{Date.today.strftime("%Y_%m_%d")}",
          page_size: 'A4',
          template: "physio_exercises/index.pdf.erb",
          title: "Physio_Exercises_History_#{Date.today.strftime("%Y_%m_%d")}",
          locals: { :physio_exercises => params[:physio_exercise].nil? ? @physio_exercises : physio_exercises_in_date_range }
        end
      end
    end
  end

  # GET /physio_exercises/1
  def show
  end

  # GET /physio_exercises/new
  def new
    @physio_exercise = PhysioExercise.new
    # if params[:client_id]
    #   @physio_exercise = User.find(params[:client_id]).physio_exercises.new
    # else
    #   @physio_exercise = User.find(params[:user_id]).physio_exercises.new
  end

  # GET /physio_exercises/1/edit
  def edit
  end

  # POST /physio_exercises
  def create
    @physio_exercise = PhysioExercise.new(physio_exercise_params)
    if params[:physio_exercise][:user_id].to_i != current_user.id
      @client = User.find(params[:user_id].to_i)
      @physio_exercise = @client.physio_exercises.new(physio_exercise_params)
      if @physio_exercise.valid?
        @physio_exercise.save
        redirect_to user_clients_path(current_user), notice: 'Phyisiotherapy exercise created for your client successfully'
      else
        render :new
      end
    else
      @user = current_user
      @physio_exercise = @user.physio_exercises.new(physio_exercise_params)
      if @physio_exercise.valid?
        @physio_exercise.save
        redirect_to user_physio_exercises_path(@user), notice: 'Physiotherapy exercise created successfully'
      else
        render :new
      end
    end
  end

  # PATCH/PUT /physio_exercises/1
  def update
    if params[:physio_exercise][:user_id].to_i != current_user.id
      @client = User.find(params[:routine][:user_id].to_i)
      @physio_exercise = @client.physio_exercises.new(physio_exercise_params)
      if @physio_exercise.valid?
        @physio_exercise.save
        redirect_to user_physio_exercises_path(user_id: current_user.id),
          notice: 'Physiotherapy exercise created for your client successfully'
      else
        render :edit
      end
    else
      @user = current_user
      @physio_exercise = @user.physio_exercises.new(physio_exercise_params)
      if @physio_exercise.valid?
        @physio_exercise.save
        redirect_to user_physio_exercises_path(@user), notice: 'Physiotherapy exercise created successfully'
      else
        render :edit
      end
    end
  end

  # DELETE /physio_exercises/1
  def destroy
    if @physio_exercise.destroy
      redirect_to user_physio_exercises_path(current_user), notice: 'Physiotherapy exercise deleted succesfully'
    else
      flash[:error] = @physio_exercise.errors.full_messages
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def physio_exercise_params
    params.require(:physio_exercise).permit(
      :name,
      :description,
      :client_id,
      :duration,
      :user_id
    )
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_physio_exercise
    @physio_exercise = PhysioExercise.find(params[:id])
  end

  def physio_exercises_in_date_range
    start_date = params[:physio_exercise][:start_date]
    end_date = params[:physio_exercise][:end_date]
    # if start_date or end_date are empty (or both), return all meals
    # need to check why if in a single line doesn't work
    if start_date.empty?
      physio_exercises = current_user.physio_exercises
      return physio_exercises
    elsif end_date.empty?
      physio_exercises = current_user.physio_exercises
      return physio_exercises
    end
    physio_exercises_in_range = []
    @physio_exercises.each do |physio_exercise|
      physio_exercise = physio_exercise.created_at.strftime("%Y-%m-%d")
      if physio_exercise.between?(start_date, end_date)
        physio_exercises_in_range << physio_exercise
      end
    end
    physio_exercises_in_range
  end
    
end
