require "rails_helper"

RSpec.describe UsersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/rankings/index").to route_to("rankings#index")
    end

    it "routes to #user" do
      expect(:get => "/rankings/user").to route_to("rankings#user")
    end

  end
end
