require "rails_helper"

RSpec.describe AnswersController, type: :routing do
  describe "routing" do

    it "routes to #new" do
      expect(:get => "/user/questions/1/answers/new").to route_to("user/answers#new", :question_id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/user/questions/1/answers/1/edit").to route_to("user/answers#edit", :question_id => "1", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/user/questions/1/answers").to route_to("user/answers#create", :question_id => "1")
    end

    it "routes to #update" do
      expect(:put => "/user/questions/1/answers/1").to route_to("user/answers#update", :question_id => "1", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/user/questions/1/answers/1").to route_to("user/answers#destroy", :question_id => "1", :id => "1")
    end
  end
end
