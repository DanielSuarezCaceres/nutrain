class FoodsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    #@ = .scoped
    @pagy, @foods = pagy(Food.all)
    if params[:meal_id]
     @pagy, @foods = pagy(Meal.find(params[:meal_id]).foods)
    end
  end

  def show
    @food = Food.find(params[:id])
  end

  def create
    @food = Food.new(food_params)
    if @food.valid?
      @food.save
    end
    redirect_to root_path, notice: 'Foods created successfully'
  end

  def update
    @food = Food.find(params[:id])
  end

  def edit
    @food = Food.find(params[:id])
  end

  def destroy
    @food = Food.find(params[:id])
  end

  private

  def food_params
    params.require(:food).permit(
        :id,
        :name,
        :brand,
        :kcal,
        :protein,
        :ch,
        :fats,
        :vegan,
        :vegetarian,
        :gluten_free,
        :nut_free,
        :soy_free,
        #:meal_id,
        :user_id,
        :serving_size
    )
  end

end
