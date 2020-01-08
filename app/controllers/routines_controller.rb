class RoutinesController < ApplicationController
  
  def index
    #@ = .scoped
    @routines = Routine.all
  end

  def show
    @routine = Routine.find(params[:id])
  end

  def new
    @routine = Routine.new
  end 

  def create
    @routine = Routine.new(routine_params)
    if @routine.valid?
      @routine.save
    end
    redirect_to root_path
  end

  def update
    #@ = .find(params[:id])
  end

  def edit
    #@ = .find(params[:id])
  end

  def destroy
    #@ = .find(params[:id])
  end

  private

  def routine_params
    params.require(:routine).permit(
      :id,
			:name,
			:description,
		)
  end

end
