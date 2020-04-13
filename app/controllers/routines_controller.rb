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
    @routine = user.routines.new(routine_params)
    #byebug
    if @routine.valid?
      @routine.save
      flash[:notice] = 'Routine created sucessfully'
      redirect_to user_routines_path(current_user)
    else
      # flash[:error] = @routine.errors.full_messages
      render :new
    end
  end

  def update
    @routine = Routine.find(params[:id])
    if @routine.update(routine_params)
      flash[:notice] = 'Routine updated sucessfully'
      redirect_to user_routines_path(current_user)
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
      flash[:notice] = 'Routine deleted sucessfully'
      redirect_to user_routines_path(current_user)
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
