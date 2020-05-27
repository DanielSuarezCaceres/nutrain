require 'rails_helper'

RSpec.describe "physio_exercises/new", type: :view do
  before(:each) do
    assign(:physio_exercise, PhysioExercise.new(
      :name => "MyString",
      :description => "MyText",
      :client => nil,
      :duration => "MyString"
    ))
  end

  it "renders new physio_exercise form" do
    render

    assert_select "form[action=?][method=?]", physio_exercises_path, "post" do

      assert_select "input[name=?]", "physio_exercise[name]"

      assert_select "textarea[name=?]", "physio_exercise[description]"

      assert_select "input[name=?]", "physio_exercise[client_id]"

      assert_select "input[name=?]", "physio_exercise[duration]"
    end
  end
end
