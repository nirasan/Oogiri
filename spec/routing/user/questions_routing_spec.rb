require "rails_helper"

RSpec.describe QuestionsController, type: :routing do
  describe "routing" do

    it "routes to #new" do
      expect(:get => "/user/questions/new").to route_to("user/questions#new")
    end

    it "routes to #edit" do
      expect(:get => "/user/questions/1/edit").to route_to("user/questions#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/user/questions").to route_to("user/questions#create")
    end

    it "routes to #update" do
      expect(:put => "/user/questions/1").to route_to("user/questions#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/user/questions/1").to route_to("user/questions#destroy", :id => "1")
    end

  end
end
