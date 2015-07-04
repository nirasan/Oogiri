require "rails_helper"

RSpec.describe User::CommentsController, type: :routing do
  describe "routing" do

    it "routes to #create" do
      expect(:post => "/user/questions/1/answers/1/comments").to route_to("user/comments#create", question_id:"1", answer_id:"1")
    end

    it "routes to #update" do
      expect(:put => "/user/questions/1/answers/1/comments/1").to route_to("user/comments#update", id: "1", question_id:"1", answer_id:"1")
    end

    it "routes to #destroy" do
      expect(:delete => "/user/questions/1/answers/1/comments/1").to route_to("user/comments#destroy", id: "1", question_id:"1", answer_id:"1")
    end

  end
end
