class Food < ApplicationRecord
  #belongs_to :meal, inverse_of: :foods
  has_many :meal_foods, inverse_of: :food
  has_many :meals, through: :meal_foods
  belongs_to :user
  # belongs_to :meal

  def name_and_amount
    "#{name}, #{serving_size}g, #{brand} (#{kcal} kcal, #{protein} p, #{carbs} ch, #{fats} f)"
  end

  # return Hash with Food statistics according to serving size
  # it it's used in meal view, it does not save or change any data
  def macros_serving_size
    food_macros_serving = Hash.new
    serving_size = (self.serving_size / 100.0)
    food_macros_serving["name"] = self.name
    food_macros_serving["kcal"] = (serving_size * self.kcal).round
    food_macros_serving["protein"] = (serving_size * self.protein).round
    food_macros_serving["carbs"] = (serving_size * self.carbs).round
    food_macros_serving["fats"] = (serving_size * self.fats).round
    food_macros_serving["vegan"] = self.vegan
    food_macros_serving["vegetarian"] = self.vegetarian
    food_macros_serving["nut_free"] = self.nut_free
    food_macros_serving["gluten_free"] = self.gluten_free
    food_macros_serving["soy_free"] = self.soy_free
    return food_macros_serving
  end

end
