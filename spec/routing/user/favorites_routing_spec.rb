require "rails_helper"

RSpec.describe User::FavoritesController, type: :routing do
  describe "routing" do

    it "routes to #create" do
      expect(:post => "/user/favorites").to route_to("user/favorites#create")
    end

    it "routes to #destroy" do
      expect(:delete => "/user/favorites/1").to route_to("user/favorites#destroy", :id => "1")
    end

  end
end
