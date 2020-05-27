require 'rails_helper'

RSpec.describe "psychology_tasks/show", type: :view do
  before(:each) do
    @psychology_task = assign(:psychology_task, PsychologyTask.create!(
      :name => "Name",
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
  end
end
