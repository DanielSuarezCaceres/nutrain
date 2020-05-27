require 'rails_helper'

RSpec.describe "physio_exercises/index", type: :view do
  before(:each) do
    assign(:physio_exercises, [
      PhysioExercise.create!(
        :name => "Name",
        :description => "MyText",
        :client => nil,
        :duration => "Duration"
      ),
      PhysioExercise.create!(
        :name => "Name",
        :description => "MyText",
        :client => nil,
        :duration => "Duration"
      )
    ])
  end

  it "renders a list of physio_exercises" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Duration".to_s, :count => 2
  end
end
