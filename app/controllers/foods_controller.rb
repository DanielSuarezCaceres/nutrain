class FoodsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    #@ = .scoped
    @pagy, @foods = pagy(current_user.foods)
    if params[:meal_id]
     @pagy, @foods = pagy(Meal.find(params[:meal_id]).foods)
    else
      @q = current_user.foods.ransack(params[:q])
      @pagy, @foods = pagy(@q.result)
    end
    respond_to do |format|
     format.html
     format.pdf do
       render pdf: "Foods_#{Date.today.strftime("%Y_%m_%d")}",
       page_size: 'A4',
       template: "foods/index.pdf.erb",
       title: "Foods_#{Date.today.strftime("%Y_%m_%d")}",
       locals: { :foods => @foods }
       #disposition: 'attachment' -> directly download without previz
     end
    end
  end

  def show
    @food = Food.find(params[:id])
  end

  def new
    @food = Food.new
  end

  def create
    @food = current_user.foods.new(food_params)
    #byebug
    if @food.valid?
      @food.save
      redirect_to user_foods_path(current_user), notice: 'Foods created successfully'
    else
      render :new
    end
  end

  def update
    @food = Food.find(params[:id])
    if @food.update(food_params)
      redirect_to user_foods_path(current_user), notice: 'Food updated successfully'
    else
      render :edit
    end
  end

  def edit
    @food = Food.find(params[:id])
  end

  def destroy
    @food = Food.find(params[:id])
    if @food.destroy
      MealFood.where(food_id: @food.id).destroy_all
      redirect_to user_foods_path(current_user), notice: 'Food deleted successfully'
    else
      redirect_to user_foods_path(current_user), error: 'Something went wrong while deleting food'
    end
  end

  def delete_all
    if current_user.foods.any?
      current_user.foods.each do |food|
        MealFood.where(food_id: food.id).destroy_all
      end
      if current_user.foods.delete_all
        redirect_to user_foods_path(current_user), notice: 'All foods deleted successfully'
      else
        redirect_to user_foods_path(current_user),
          :flash => { :error => "Something went wrong while deleting foods. You might have lost some of them" }
      end
    else
      redirect_to user_foods_path(current_user),
        :flash => { :error => "No foods to delete"}
    end
  end

  private

  def food_params
    params.require(:food).permit(
        :id,
        :name,
        :brand,
        :kcal,
        :protein,
        :carbs,
        :fats,
        :vegan,
        :vegetarian,
        :gluten_free,
        :nut_free,
        :soy_free,
        #:meal_id,
        :serving_size,
        :user_id
    )
  end

end
