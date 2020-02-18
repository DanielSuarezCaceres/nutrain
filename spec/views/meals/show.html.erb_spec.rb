require 'rails_helper'

RSpec.describe "meals/show", type: :view do
  before(:each) do
    @meal = assign(:meal, Meal.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
