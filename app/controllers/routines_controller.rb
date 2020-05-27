class RoutinesController < ApplicationController
  #before_action :set_physio_exercise, only: [:show, :edit, :update, :destroy]

  def index
    if params[:client_id]
      @routines = User.find(params[:client_id]).routines
    else
      @routines = User.find(params[:user_id]).routines
      respond_to do |format|
        format.html
        format.pdf do
          render pdf: "Routines_#{Date.today.strftime("%Y_%m_%d")}",
          page_size: 'A4',
          template: "routines/index.pdf.erb",
          title: "Routines_#{Date.today.strftime("%Y_%m_%d")}",
          locals: { :routines => @routines }
          #disposition: 'attachment' -> directly download without previz
        end
      end
    end
  end

  def show
    @routine = Routine.find(params[:id])
  end

  def new
    # @routine = Routine.new
    if params[:client_id]
      @routine = User.find(params[:client_id]).routines.new
    else
      @routine = User.find(params[:user_id]).routines.new 
    end
  end

  def edit
    @routine = Routine.find(params[:id])
  end

  def create
    # if id's are different, routine is being created by a professional for one of his clients
    if params[:routine][:user_id].to_i != current_user.id
      @client = User.find(params[:routine][:user_id].to_i)
      @routine = @client.routines.new(routine_params)
      if @routine.valid?
        @routine.save
        redirect_to user_clients_path(user_id: current_user.id), notice: 'Routine created for your client successfully'
      else
        render :new
      end
    else
      @user = current_user
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
      if params[:routine][:user_id].to_i != current_user.id
        redirect_to user_clients_path(current_user),
          notice: "Routine updated for client successfully"
      else
        redirect_to user_routines_path(current_user), notice: 'Routine updated successfully'
      end
    else
      render :edit
    end
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
