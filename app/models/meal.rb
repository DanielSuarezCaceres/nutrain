class Meal < ApplicationRecord
  belongs_to :user
  #has_many :foods, inverse_of: :meal, dependent: :destroy
  has_many :meal_foods, inverse_of: :meal, dependent: :destroy
  has_many :foods, through: :meal_foods
  accepts_nested_attributes_for :foods, reject_if: :all_blank, allow_destroy: true
  before_save :calculate_total_macros_food

  validates :name, presence: true

  def ingredients_ids
    ingredient_ids = []
    self.foods.each do |food|
      ingredient_ids << food.id
    end
    ingredient_ids
  end

  def calculate_total_macros_food
    #byebug
    self.kcal = self.protein = self.carbs = self.fats = 0.0
    self.vegan = self.vegetarian = self.nut_free = self.gluten_free = self.soy_free = false

    #byebug
    if meal_foods.empty?
      return
    else
      meal_foods.each do |meal_food|
        food = Food.find(meal_food.food_id)
        serving_size = (food.serving_size / 100.0)
        self.kcal += (serving_size * food.kcal).round
        self.protein += (serving_size * food.protein).round
        self.carbs += (serving_size * food.carbs).round
        self.fats += (serving_size * food.fats).round
        self.vegan = food.vegan
        self.vegetarian = food.vegetarian
        self.nut_free = food.nut_free
        self.gluten_free = food.gluten_free
        self.soy_free = food.soy_free
      end
    end
  end

  def add_ingredient_macros(food_id)
    byebug
    food = Food.find(food_id)
    food_serving_size = food.serving_size / 100
    self.kcal += (food.kcal * food_serving_size)
    self.protein += (food.protein * food_serving_size)
    self.carbs += (food.carbs * food_serving_size)
    self.fats += (food.fats * food_serving_size)
    byebug
    return
  end

  def clear_ingredient_macros(food_params)
    byebug
    food_serving_size = (food_params[:serving_size].to_f / 100)
    self.kcal -= (food_params[:kcal].to_f * food_serving_size)
    self.protein -= (food_params[:protein].to_f * food_serving_size)
    self.carbs -= (food_params[:carbs].to_f * food_serving_size)
    self.fats -= (food_params[:fats].to_f * food_serving_size)
    byebug
    return
  end

  def self.total_kcal_macros_today(user_id)
    total_macros = Hash.new
    total_macros["kcal"] = total_macros["protein"] = total_macros["carbs"] = total_macros["fats"] = 0
    User.find(user_id).meals.where('DATE(day) = ?', Date.today).each do |meal|
      total_macros["kcal"] += meal.kcal
      total_macros["protein"] += meal.protein
      total_macros["carbs"] += meal.carbs
      total_macros["fats"] += meal.fats
    end
    total_macros
  end

  def self.total_kcal_meals_today(user_id)
    # byebug
    total_kcal = 0
    User.find(user_id).meals.where('DATE(day) = ?', Date.today).each do |meal|
      total_kcal += meal.kcal unless meal.kcal.nil? 
    end
    total_kcal
  end

  def self.total_protein_meals_today(user_id)
    total_protein = 0
    User.find(user_id).meals.where('DATE(day) = ?', Date.today).each do |meal|
      total_protein += meal.protein unless meal.protein.nil?
    end
    total_protein.round
  end

  def self.total_carbs_meals_today(user_id)
    total_carbs = 0
    User.find(user_id).meals.where('DATE(day) = ?', Date.today).each do |meal|
      total_carbs += meal.carbs unless meal.carbs.nil? 
    end
    total_carbs.round
  end

  def self.total_fats_meals_today(user_id)
    total_fats = 0
    User.find(user_id).meals.where('DATE(day) = ?', Date.today).each do |meal|
      total_fats += meal.fats unless meal.fats.nil? 
    end
    total_fats.round
  end

  def vegan?
    self.vegan ? 'Yes' : 'No'
  end

  def vegetarian?
    self.vegetarian ? 'Yes' : 'No'
  end

  def gluten_free?
    self.gluten_free ? 'Yes' : 'No'
  end

  def soy_free?
    self.soy_free ? 'Yes' : 'No'
  end

  def nut_free?
    self.soy_free ? 'Yes' : 'No'
  end

  def get_all_foods
    all_foods = []
    foods.each do |food|
      all_foods << food
    end
    all_foods
  end

  # used in edit meal view to display ingredient macros in table
  def foods_converted
    foods_result = []
    self.foods.each do |food|
      food_macros_serving = Hash.new
      serving_size = (food.serving_size / 100.0)
      food_macros_serving["name"] = self.name
      food_macros_serving["kcal"] = (serving_size * food.kcal).round
      food_macros_serving["protein"] = (serving_size * food.protein).round
      food_macros_serving["carbs"] = (serving_size * food.carbs).round
      food_macros_serving["fats"] = (serving_size * food.fats).round
      food_macros_serving["vegan"] = food.vegan
      food_macros_serving["vegetarian"] = food.vegetarian
      food_macros_serving["nut_free"] = food.nut_free
      food_macros_serving["gluten_free"] = food.gluten_free
      food_macros_serving["soy_free"] = food.soy_free
      foods_result.push(food_macros_serving)
    end
    return foods_result
  end

  def self.last_week_meals(user_id)
    User.find(user_id).meals.where('day BETWEEN ? AND ?', (Date.today - 6.day), Date.today)
  end

  def self.last_month_meals(user_id)
    User.find(user_id).meals.where('day BETWEEN ? AND ?', (Date.today - 1.month), Date.today)
  end

  def self.last_trimester_meals(user_id)
    User.find(user_id).meals.where('day BETWEEN ? AND ?', (Date.today - 3.month), Date.today)
  end

end
