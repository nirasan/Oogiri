require 'rails_helper'

RSpec.describe RankingsController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #user" do
    it "returns http success" do
      get :user
      expect(response).to have_http_status(:success)
    end
  end

end
