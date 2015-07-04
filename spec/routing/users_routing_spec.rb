require "rails_helper"

RSpec.describe UsersController, type: :routing do
  describe "routing" do

    it "routes to #show" do
      expect(:get => "/users/1").to route_to("users#show", :id => "1")
    end

    it "routes to #questions" do
      expect(:get => "/users/1/questions").to route_to("users#questions", :id => "1")
    end

    it "routes to #answers" do
      expect(:get => "/users/1/answers").to route_to("users#answers", :id => "1")
    end

    it "routes to #comments" do
      expect(:get => "/users/1/comments").to route_to("users#comments", :id => "1")
    end

    it "routes to #favorite_users" do
      expect(:get => "/users/1/favorite_users").to route_to("users#favorite_users", :id => "1")
    end

    it "routes to #favorited_users" do
      expect(:get => "/users/1/favorited_users").to route_to("users#favorited_users", :id => "1")
    end

  end
end
