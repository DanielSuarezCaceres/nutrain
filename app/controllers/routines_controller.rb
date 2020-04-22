class RoutinesController < ApplicationController
  def index
    if params[:client_id]
      @routines = User.find(params[:client_id]).routines
    else
      @routines = User.find(params[:user_id]).routines
    end
  end

  def show
    @routine = Routine.find(params[:id])
  end

  def new
    @routine = Routine.new
  end

  def create
    if params[:client_id]
      @user = User.find(params[:client_id])
      @routine = @user.routines.new(routine_params)
      if @routine.valid?
        @routine.save
        redirect_to user_clients_path(user_id: params[:user_id]), notice: 'Routine created for your client successfully'
      else
        render :new
      end
    else
      @user = User.find(params[:user_id])
      @routine = @user.routines.new(routine_params)
      if @routine.valid?
        @routine.save
        redirect_to user_routines_path(@user), notice: 'Routine created successfully'
      else
        render :new
      end
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
      :client_id,
      :days_of_exercise,
      :goal,
      :active
		)
  end

  def set_routine
    @routine = Routine.find(params[:id])
  end

end
