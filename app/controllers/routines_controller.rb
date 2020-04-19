class RoutinesController < ApplicationController
  def index
    #@ = .scoped
    #@routines = Routine.all
    @routines = User.find(params[:user_id]).routines
  end

  def show
    @routine = Routine.find(params[:id])
  end

  def new
    @routine = Routine.new
  end

  def create
    #@routine = Routine.new(routine_params)
    #@user = User.find(params[:user_id])
    user = current_user
    byebug
    @routine = user.routines.new(routine_params)
    #byebug
    if @routine.valid?
      @routine.save
      redirect_to user_routines_path(current_user), notice: 'Routine created successfully'
    else
      # flash[:error] = @routine.errors.full_messages
      render :new
    end
  end

  def update
    @routine = Routine.find(params[:id])
    if @routine.update(routine_params)
      redirect_to user_routines_path(current_user), notice: 'Routine updated successfully'
    else
      # flash[:error] = @routine.errors.full_messages
      render :edit
    end
  end

  def edit
    @routine = Routine.find(params[:id])
  end

  def destroy
    @routine = Routine.find(params[:id])
    if @routine.destroy
      redirect_to user_routines_path(current_user), notice: 'Routine deleted successfully'
    else
      flash[:error] = @routine.errors.full_messages
      # redirect_to user_routines_path(current_user)
    end
  end

  private

  def routine_params
    params.require(:routine).permit(
      :id,
			:name,
			:description,
      :user_id,
      :days_of_exercise,
      :goal,
      :active
		)
  end

  def set_routine
    @routine = Routine.find(params[:id])
  end

end
