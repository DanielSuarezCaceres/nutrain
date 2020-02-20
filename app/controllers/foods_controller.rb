class FoodsController < ApplicationController

  def index
    #@ = .scoped
    @foods = Food.all
    if params[:meal_id]
      @foods = Meal.find(params[:meal_id]).foods
    end
  end

  def show
    @food = Food.find(params[:id])
  end

  def create
    @food = Food.new(food_params)
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
        :meal_id,
    )
  end

end
