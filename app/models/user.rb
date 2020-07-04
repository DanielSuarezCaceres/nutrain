# frozen_string_literal: true

class User < ApplicationRecord
  has_many :measurements
  has_many :routines
  # has_many :workout_exercises, dependent: :destroy
  # has_many :workouts, through: :workout_exercises
  has_many :workouts
  has_many :exercises, dependent: :destroy
  #has_many :workouts, dependent: :destroy
  has_many :diets
  has_many :meals, dependent: :destroy
  # has_many :meal_foods
  # has_many :meals, through: :meal_foods
  has_many :foods, dependent: :destroy
  has_many :physio_exercises
  has_many :psychology_tasks
  has_many :appointments

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #attr_accessor :current_password
=begin
  def update_with_password(params={})
    current_password = params.delete(:current_password) if !params[:current_password].blank?

    if params[:password].blank?
      params.delete(:password)
      params.delete(:password_confirmation) if params[:password_confirmation].blank?
    end

    result = if has_no_password?  || valid_password?(current_password)
               update_attributes(params)
             else
               self.errors.add(:current_password, current_password.blank? ? :blank : :invalid)
               self.attributes = params
               false
             end

    clean_up_passwords
    result
  end
=end

  def has_no_password?
    self.encrypted_password.blank?
  end

  def fullname
    "#{name} #{lastname}"
  end

  def self.users_except_admin(current_user_id)
    where.not(id: current_user_id).where.not(type: 'Admin')
  end

  def self.users_without_contract(user_id)
    user = User.find(user_id)
    all_users = User.where.not(id: user_id)
    users_with_contract = []
    if user.type == 'Professional'
      user.contracts.each do |c|
        users_with_contract << User.find(c.client_id)
      end
      users_with_contract
    else
      user.contracts.each do |c|
        users_with_contract << User.find(c.professional_id)
      end
      users_with_contract
    end
  end

  def self.only_professionals
    where(type: 'Professional')
  end

  def self.only_clients
    where(type: 'Client')
  end

  def get_current_diet
    self.diets.where(active: true).first
  end
  
  def get_current_routine
    self.routines.where(active: true).first
  end

  def get_all_exercises
    exercises = []
    self.workouts.each do |workout|
      workout.exercises.each do |exercise|
        exercises << exercise
      end
    end
    exercises
  end

  def get_all_foods
    foods = []
    self.meals.each do |meal|
      meal.foods.each do |food|
        foods << food
      end
    end
    foods
  end
  
end
