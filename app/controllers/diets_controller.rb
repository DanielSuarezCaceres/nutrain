class DietsController < ApplicationController

  def index
    @diets = User.find(params[:user_id]).diets
  end

  def show
    #@ = .find(params[:id])
  end

  def new
    @diet = Diet.new4
  end
  
  def create
    @diet = Diet.new(diet_params)
    if @diet.valid?
      @diet.save
    end
    redirect_to diets_path
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

  def diet_params
    params.require(:diet).permit(
      :id,
      :name,
      :description,
    )
  end  

end
