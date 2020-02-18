require 'rails_helper'

RSpec.describe "meals/new", type: :view do
  before(:each) do
    assign(:meal, Meal.new())
  end

  it "renders new meal form" do
    render

    assert_select "form[action=?][method=?]", meals_path, "post" do
    end
  end
end
