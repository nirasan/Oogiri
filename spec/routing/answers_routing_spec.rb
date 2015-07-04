require "rails_helper"

RSpec.describe AnswersController, type: :routing do
  describe "routing" do


    it "routes to #index" do
      expect(:get => "/answers").to route_to("answers#index")
    end

    it "routes to #show" do
      expect(:get => "/questions/1/answers/1").to route_to("answers#show", :question_id => "1", :id => "1")
    end
  end
end
