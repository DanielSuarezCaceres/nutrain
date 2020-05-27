require "rails_helper"

RSpec.describe PsychologyTasksController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/psychology_tasks").to route_to("psychology_tasks#index")
    end

    it "routes to #new" do
      expect(:get => "/psychology_tasks/new").to route_to("psychology_tasks#new")
    end

    it "routes to #show" do
      expect(:get => "/psychology_tasks/1").to route_to("psychology_tasks#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/psychology_tasks/1/edit").to route_to("psychology_tasks#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/psychology_tasks").to route_to("psychology_tasks#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/psychology_tasks/1").to route_to("psychology_tasks#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/psychology_tasks/1").to route_to("psychology_tasks#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/psychology_tasks/1").to route_to("psychology_tasks#destroy", :id => "1")
    end
  end
end
