require 'rails_helper'

RSpec.describe "PhysioExercises", type: :request do
  describe "GET /physio_exercises" do
    it "works! (now write some real specs)" do
      get physio_exercises_path
      expect(response).to have_http_status(200)
    end
  end
end
