require 'rails_helper'

RSpec.describe "psychology_tasks/index", type: :view do
  before(:each) do
    assign(:psychology_tasks, [
      PsychologyTask.create!(
        :name => "Name",
        :description => "MyText"
      ),
      PsychologyTask.create!(
        :name => "Name",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of psychology_tasks" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
