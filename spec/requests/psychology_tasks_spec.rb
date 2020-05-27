require 'rails_helper'

RSpec.describe "PsychologyTasks", type: :request do
  describe "GET /psychology_tasks" do
    it "works! (now write some real specs)" do
      get psychology_tasks_path
      expect(response).to have_http_status(200)
    end
  end
end
