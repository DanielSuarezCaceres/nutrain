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
    # temporary, see how to pass the id of another user (the id of a client you are creating a diet for)
    #@user = User.find(params[:user_id])
    @diet = current_user.diets.new(diet_params)
    if @diet.valid?
      #change_active_diet(current_user.id, @diet)
      @diet.save
      flash[:notice] = 'Diet created sucessfully'
      redirect_to user_diets_path(current_user)
    else
      flash[:error] = @diet.errors
      render :new
    end 
  end

  def update
    @diet = Diet.find(params[:id])
    if @diet.update(diet_params)
      #if @diet.active
      #  change_active_diet(current_user.id, @diet)
      #end
      flash[:notice] = 'Diet updated sucessfully'
      redirect_to user_diets_path(current_user)
    else
      flash[:error] = @diet.errors
      render :edit
    end
  end

  def edit
    @diet = Diet.find(params[:id])
  end

  def destroy
    @diet = Diet.find(params[:id])
    if @diet.destroy
      flash[:notice] = 'Diet deleted successfully'
      redirect_to user_diets_path
    else
      flash[:error] = 'Something went wrong while deleting diet'
      redirect_to user_diet_path(@diet)
    end
  end

  private

  def diet_params
    params.require(:diet).permit(
      :id,
      :name,
      :description,
      :user_id,
      :kcal_goal,
      :total_meals,
      :active,
      :goal
    )
  end

  #def change_active_diet(user_id, current_diet)
  #  user = User.find(user_id)
  #  diets = user.diets.where.not(id: current_diet.id).where(active: true)
  #  unless diets.count.zero?
  #    if diets.count == 1
  #      diets.first.update(active: false)
  #    else
  #      diets.each do |diet|
  #        diet.update(active: false)
  #      end
  #    end
  #  end
  #end

end
