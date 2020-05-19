class Meal < ApplicationRecord
  belongs_to :user
  #has_many :foods, inverse_of: :meal, dependent: :destroy
  has_many :dishes, inverse_of: :meal
  has_many :foods, through: :dishes
  accepts_nested_attributes_for :foods, reject_if: :all_blank, allow_destroy: true
  before_save :calculate_total_macros_food
  before_update :calculate_total_macros_food

  validates :name, presence: true
  # validates :description, presence: true (?)
  
  #attr_accessor :foods_attributes


  def calculate_total_macros_food
    self.kcal = self.protein = self.carbs = self.fats = 0.0
    self.vegan = self.vegetarian = self.nut_free = self.gluten_free = self.soy_free = false

    foods.each do |food|
      #byebug
      serving_size = (food.serving_size / 100.0)
      self.kcal += (serving_size * food.kcal)
      self.protein += (serving_size * food.protein)
      self.carbs += (serving_size * food.carbs)
      self.fats += (serving_size * food.fats)
      self.vegan = food.vegan
      self.vegetarian = food.vegetarian
      self.nut_free = food.nut_free
      self.gluten_free = food.gluten_free
      self.soy_free = food.soy_free
    end
  end

  def self.total_kcal_macros_today(user_id)
    total_macros = Hash.new
    total_macros["kcal"] = total_macros["protein"] = total_macros["carbs"] = total_macros["fats"] = 0
    User.find(user_id).meals.where('DATE(created_at) = ?', Date.today).each do |meal|
      total_macros["kcal"] += meal.kcal
      total_macros["protein"] += meal.protein
      total_macros["carbs"] += meal.carbs
      total_macros["fats"] += meal.fats
    end
    total_macros
  end

  def self.total_kcal_meals_today(user_id)
    total_kcal = 0
    User.find(user_id).meals.where('DATE(created_at) = ?', Date.today).each do |meal|
      total_kcal += meal.kcal
    end
    total_kcal
  end

  def self.total_protein_meals_today(user_id)
    total_protein = 0
    User.find(user_id).meals.where('DATE(created_at) = ?', Date.today).each do |meal|
      total_protein += meal.protein
    end
    total_protein
  end

  def self.total_carbs_meals_today(user_id)
    total_carbs = 0
    User.find(user_id).meals.where('DATE(created_at) = ?', Date.today).each do |meal|
      total_carbs += meal.carbs
    end
    total_carbs
  end

  def self.total_fats_meals_today(user_id)
    total_fats = 0
    User.find(user_id).meals.where('DATE(created_at) = ?', Date.today).each do |meal|
      total_fats += meal.fats
    end
    total_fats
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

end
