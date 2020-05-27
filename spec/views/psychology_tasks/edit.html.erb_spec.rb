require 'rails_helper'

RSpec.describe "psychology_tasks/edit", type: :view do
  before(:each) do
    @psychology_task = assign(:psychology_task, PsychologyTask.create!(
      :name => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit psychology_task form" do
    render

    assert_select "form[action=?][method=?]", psychology_task_path(@psychology_task), "post" do

      assert_select "input[name=?]", "psychology_task[name]"

      assert_select "textarea[name=?]", "psychology_task[description]"
    end
  end
end
