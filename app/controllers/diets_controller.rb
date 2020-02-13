class DietsController < ApplicationController

  def index
    @diets = User.find(params[:user_id]).diets
  end

  def show
    @diet = Diet.find(params[:id])
  end

  def new
    @diet = Diet.new
  end
  
  def create
    @user = User.find(params[:user_id])
    @diet = @user.diets.new(diet_params)
    if @diet.valid?
      @diet.save
    end
    redirect_to user_diets_path
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
      :user_id,
    )
  end  

end
