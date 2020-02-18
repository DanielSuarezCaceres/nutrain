require 'rails_helper'

RSpec.describe "meals/index", type: :view do
  before(:each) do
    assign(:meals, [
      Meal.create!(),
      Meal.create!()
    ])
  end

  it "renders a list of meals" do
    render
  end
end
