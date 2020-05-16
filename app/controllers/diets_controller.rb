class DietsController < ApplicationController

  def index
    if params[:client_id]
      @diets = User.find(params[:client_id]).diets
    else
      @diets = User.find(params[:user_id]).diets
      respond_to do |format|
        format.html
        format.pdf do
          render pdf: "Diets_#{Date.today.strftime("%Y_%m_%d")}",
          page_size: 'A4',
          template: "diets/index.pdf.erb",
          title: "Diets_#{Date.today.strftime("%Y_%m_%d")}",
          locals: { :diets => @diets }
          #disposition: 'attachment' -> directly download without previz
        end
      end
    end
  end

  def show
    @diet = Diet.find(params[:id])
  end

  def new
    @diet = Diet.new
    if params[:client_id]
      @diet = User.find(params[:client_id]).diets.new
    else
      @diet = User.find(params[:user_id]).diets.new 
    end
  end

  def edit
    #byebug
    @diet = Diet.find(params[:id])
  end
  
  def create
    #byebug
    if params[:client_id]
      @user = User.find(params[:client_id])
      @diet = @user.diets.new(diet_params)
      if @diet.valid?
        @diet.save
        redirect_to user_clients_path(user_id: params[:user_id]), notice: 'Diet created for your client successfully'
      else
        render :new
      end
    else
      #@user = User.find(params[:user_id])
      @user = current_user
      @diet = @user.diets.new(diet_params)
      if @diet.valid?
        @diet.save
        redirect_to user_diets_path(@user), notice: 'Diet created successfully'
      else
        render :new
      end
    end
  end

  def update
    #byebug
    @diet = Diet.find(params[:id])
    if @diet.update(diet_params)
      redirect_to user_diets_path(current_user), notice: 'Diet updated successfully'
    else
      # flash[:error] = @diet.errors.full_messages
      render :edit
    end
  end

  def destroy
    @diet = Diet.find(params[:id])
    if @diet.destroy
      redirect_to user_diets_path(current_user), notice: 'Diet deleted successfully'
    else
      flash[:error] = @diet.errors.full_messages
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
      :client_id,
      :kcal_goal,
      :total_meals,
      :active,
      :goal
    )
  end

end
