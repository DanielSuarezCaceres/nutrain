class MealsController < ApplicationController
  before_action :set_meal, only: [:show, :edit, :update, :destroy]

  # GET /meals
  def index
    #@meals = Meal.all
    if params[:user_id]
      @meals = User.find(params[:user_id]).meals
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
  # GET /meals/1.json
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
    # @user = User.find(params[:user_id])
    user = current_user
    @meal = user.meals.new(meal_params)
    # check existing ingredients sent by select2
    add_existing_ingredients
    # byebug
    if @meal.valid?
      @meal.save
      redirect_to root_path, notice: 'Meal added successfully' # (current_user)
    else
      render :new
    end
  end

  # PATCH/PUT /meals/1
  def update
    #if params[:meal][:food_ids]
    #  params[:meal][:food_ids].each do |ingredient|
    #    @meal.foods << Food.find(ingredient) unless @meal.foods.include? Food.find(ingredient)
    #  end
    #end
    update_ingredients
    # byebug
    if @meal.update(meal_params)
      #if params[:meal][:food_ids]
      #  update_meal_foods
      #end
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
      flash[:error] = @meal.errors.full_messages
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_meal
    @meal = Meal.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def meal_params
    #params.fetch(:meal, {})
    params.require(:meal).permit(
        :id,
        :name,
        :description,
        :file,
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

  def update_meal_foods
    new_ingredients = []
    params[:meal][:food_ids].each do |ing_id|
      new_ingredients << Food.find(ing_id)
    end
    
    @meal.foods.each do |food|
      @meal.foods.delete(food) unless new_ingredients.include? food
      #if !new_ingredientes.include? food then @meal.foods.delete(food)
    end
    return
  end

  def update_ingredients
    selected_ingredients_ids = params[:meal][:food_ids]
    if params[:meal][:foods_attributes]
      params[:meal][:foods_attributes].each do |key, value|
        #byebug
        if value["id"].nil?
          next
        else
          #byebug
          params[:meal][:foods_attributes].delete(key) unless selected_ingredients_ids.include? value["id"]
        end
      end
    end
    #byebug
    aux = true
  end

  def add_existing_ingredients
    if params[:meal][:food_ids]
      params[:meal][:food_ids].each do |ingredient|
        @meal.foods << Food.find(ingredient) unless @meal.foods.include? Food.find(ingredient)
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

end
