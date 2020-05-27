require 'rails_helper'

RSpec.describe "psychology_tasks/new", type: :view do
  before(:each) do
    assign(:psychology_task, PsychologyTask.new(
      :name => "MyString",
      :description => "MyText"
    ))
  end

  it "renders new psychology_task form" do
    render

    assert_select "form[action=?][method=?]", psychology_tasks_path, "post" do

      assert_select "input[name=?]", "psychology_task[name]"

      assert_select "textarea[name=?]", "psychology_task[description]"
    end
  end
end
