require "rails_helper"

RSpec.describe AnswersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/questions/1/answers").to route_to(:"answers#index", :question_id => "1")
    end

    it "routes to #new" do
      expect(:get => "/questions/1/answers/new").to route_to("answers#new", :question_id => "1")
    end

    it "routes to #show" do
      expect(:get => "/questions/1/answers/1").to route_to("answers#show", :question_id => "1", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/questions/1/answers/1/edit").to route_to("answers#edit", :question_id => "1", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/questions/1/answers").to route_to("answers#create", :question_id => "1")
    end

    it "routes to #update" do
      expect(:put => "/questions/1/answers/1").to route_to("answers#update", :question_id => "1", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/questions/1/answers/1").to route_to("answers#destroy", :question_id => "1", :id => "1")
    end

  end
end
