class MealsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_meal, only: [:show, :edit, :update, :destroy]

  # GET /meals
  def index
    if params[:user_id]
      @q = User.find(current_user.id).meals.ransack(params[:q])
      @pagy, @meals = pagy(@q.result)
      #@pagy, @meals = pagy(User.find(params[:user_id]).meals)
      respond_to do |format|
        format.html
        format.pdf do
          render pdf: "Meals_History_#{Date.today.strftime("%Y_%m_%d")}",
          page_size: 'A4',
          template: "meals/index.pdf.erb",
          title: "Meals_History_#{Date.today.strftime("%Y_%m_%d")}",
          locals: { :meals => params[:meal].nil? ? @meals : meals_in_date_range }
          #disposition: 'attachment' -> directly download without previz
        end
      end
    end
  end

  # GET /meals/1
  def show
    @meal = Meal.find(params[:id])
  end

  # GET /meals/new
  def new
    @meal = User.find(params[:user_id]).meals.new
  end

  # GET /meals/1/edit
  def edit
  end

  # POST /meals
  def create
    user = current_user
    @meal = user.meals.new(meal_params)
    # check existing ingredients sent by select2
    #add_existing_ingredients
    if @meal.valid?
      @meal.save
      redirect_to root_path, notice: 'Meal added successfully' # (current_user)
    else
      render :new
    end
  end

  # PATCH/PUT /meals/1
  def update
    check_selected_ingredients
    if @meal.update(meal_params)
      redirect_to root_path, notice: 'Meal updated successfully'
    else
      render :edit
    end
  end

  # DELETE /meals/1
  def destroy
    if @meal.destroy
      redirect_to root_path, notice: 'Meal deleted successfully'
    else
      redirect_to user_meals_path(current_user),
      :flash => { :error => "Something went wrong while deleting meal" }
    end
  end

  def delete_all
    if current_user.meals.delete_all
      redirect_to user_meals_path(current_user), notice: 'All meals deleted successfully'
    else
      redirect_to user_meals_path(current_user),
        :flash => { :error => "Something went wrong while deleting meals" }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_meal
    @meal = Meal.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def meal_params
    params.require(:meal).permit(
        :id,
        :name,
        :description,
        :day,
        :kcal,
        :protein,
        :carbs,
        :fats,
        :vegan,
        :vegetarian,
        :gluten_free,
        :nut_free,
        :soy_free,
        :user_id,
        :start_date,
        :end_date,
        :user_id,
        foods_attributes: %i[id name user_id brand kcal protein carbs fats serving_size vegan vegetarian gluten_free nut_free soy_free _destroy],
        food_ids: [],
    )
  end

  def add_existing_ingredients
    if params[:meal][:food_ids]
      params[:meal][:food_ids].each do |ingredient|
        byebug
        #@meal.foods << Food.find(ingredient) unless @meal.foods.include? Food.find(ingredient)
        if @meal.foods.include?(Food.find(ingredient))
          next
        else
          @meal.foods << Food.find(ingredient)
          @meal.add_ingredient_macros(ingredient)
        end
      end
    end
    return
  end

  def meals_in_date_range
    start_date = params[:meal][:start_date]
    end_date = params[:meal][:end_date]
    # if start_date or end_date are empty (or both), return all meals
    # need to check why if in a single line doesn't work
    if start_date.empty?
      meals = current_user.meals
      return meals
    elsif end_date.empty?
      meals = current_user.meals
      return meals
    end
    meals_in_range = []
    @meals.each do |meal|
      meal_date = meal.created_at.strftime("%Y-%m-%d")
      if meal_date.between?(start_date, end_date)
        meals_in_range << meal
      end
    end
    meals_in_range
  end

  def check_selected_ingredients
    prev_ingredients_ids = @meal.ingredients_ids
    if params[:meal][:food_ids]
      selected_ingredients_ids = params[:meal][:food_ids]
      #check initial ingredients and compare with ingredients selected in select2
      #delete those who were before and now are not in the select2
      prev_ingredients_ids.each do |id_ingr|
        if !(selected_ingredients_ids.include? id_ingr.to_s)
          #substract_ingredient_macros(id_ingr)
          @meal.meal_foods.where(meal_id: @meal.id, food_id: id_ingr).first.destroy
        end
      end

    else
      @meal.meal_foods.delete_all
    end
  end

  def substract_ingredient_macros(id_ingr)
    food = Food.find(id_ingr)
    serving_size = (food.serving_size / 100)
    @meal.kcal -= (serving_size * food.kcal).round
    @meal.protein -= (serving_size * food.protein).round
    @meal.carbs -= (serving_size * food.carbs).round
    @meal.fats -= (serving_size * food.fats).round
  end

end
