require 'rails_helper'

RSpec.describe "measurements/index", type: :view do
  before(:each) do
    assign(:measurements, [
      Measurement.create!(),
      Measurement.create!()
    ])
  end

  it "renders a list of measurements" do
    render
  end
end
