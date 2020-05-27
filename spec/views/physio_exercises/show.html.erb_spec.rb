require 'rails_helper'

RSpec.describe "physio_exercises/show", type: :view do
  before(:each) do
    @physio_exercise = assign(:physio_exercise, PhysioExercise.create!(
      :name => "Name",
      :description => "MyText",
      :client => nil,
      :duration => "Duration"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Duration/)
  end
end
