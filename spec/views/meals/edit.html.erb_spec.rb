require 'rails_helper'

RSpec.describe "meals/edit", type: :view do
  before(:each) do
    @meal = assign(:meal, Meal.create!())
  end

  it "renders the edit meal form" do
    render

    assert_select "form[action=?][method=?]", meal_path(@meal), "post" do
    end
  end
end
