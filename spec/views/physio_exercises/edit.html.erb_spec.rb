require 'rails_helper'

RSpec.describe "physio_exercises/edit", type: :view do
  before(:each) do
    @physio_exercise = assign(:physio_exercise, PhysioExercise.create!(
      :name => "MyString",
      :description => "MyText",
      :client => nil,
      :duration => "MyString"
    ))
  end

  it "renders the edit physio_exercise form" do
    render

    assert_select "form[action=?][method=?]", physio_exercise_path(@physio_exercise), "post" do

      assert_select "input[name=?]", "physio_exercise[name]"

      assert_select "textarea[name=?]", "physio_exercise[description]"

      assert_select "input[name=?]", "physio_exercise[client_id]"

      assert_select "input[name=?]", "physio_exercise[duration]"
    end
  end
end
