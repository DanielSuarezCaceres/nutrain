require "rails_helper"

RSpec.describe PhysioExercisesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/physio_exercises").to route_to("physio_exercises#index")
    end

    it "routes to #new" do
      expect(:get => "/physio_exercises/new").to route_to("physio_exercises#new")
    end

    it "routes to #show" do
      expect(:get => "/physio_exercises/1").to route_to("physio_exercises#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/physio_exercises/1/edit").to route_to("physio_exercises#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/physio_exercises").to route_to("physio_exercises#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/physio_exercises/1").to route_to("physio_exercises#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/physio_exercises/1").to route_to("physio_exercises#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/physio_exercises/1").to route_to("physio_exercises#destroy", :id => "1")
    end
  end
end
