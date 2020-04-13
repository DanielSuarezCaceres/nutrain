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
    user = current_user
    @diet = user.diets.new(diet_params)
    if @diet.valid?
      @diet.save
      redirect_to user_diets_path(current_user), notice: 'Diet created successfully'
    else
      # flash[:error] = @diet.errors.full_messages
      render :new
    end 
  end

  def update
    @diet = Diet.find(params[:id])
    if @diet.update(diet_params)
      redirect_to user_diets_path(current_user), notice: 'Diet updated successfully'
    else
      # flash[:error] = @diet.errors.full_messages
      render :edit
    end
  end

  def edit
    @diet = Diet.find(params[:id])
  end

  def destroy
    @diet = Diet.find(params[:id])
    if @diet.destroy
      redirect_to user_diets_path(current_user), notice: 'Diet deleted successfully'
    else
      flash[:error] = @routine.errors.full_messages
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

end
