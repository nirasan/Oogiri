require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe User::FavoritesController, type: :controller do
  include Devise::TestHelpers

  let!(:user1) { create(:user) }
  let!(:user2) { create(:user) }

  let(:valid_attributes) {
    {from_user_id: user1.to_param, to_user_id: user2.to_param}
  }

  let(:invalid_attributes) {
    {}
  }

  before do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    sign_in user1
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Favorite" do
        expect {
          post :create, {format: :js, to_user_id: user2.to_param}
        }.to change(Favorite, :count).by(1)
      end

      it "assigns a newly created favorite as @favorite" do
        post :create, {format: :js, to_user_id: user2.to_param}
        expect(assigns(:favorite)).to be_a(Favorite)
        expect(assigns(:favorite)).to be_persisted
      end

      it "redirects to the created favorite" do
        post :create, {format: :js, to_user_id: user2.to_param}
        expect(response).to have_http_status(200)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved favorite as @favorite" do
        post :create, {format: :js}
        expect(assigns(:favorite)).to be_a_new(Favorite)
      end

      it "re-renders the 'new' template" do
        post :create, {format: :js}
        expect(response).to have_http_status(200)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested favorite" do
      favorite = Favorite.create! valid_attributes
      expect {
        delete :destroy, {format: :js, :id => favorite.to_param}
      }.to change(Favorite, :count).by(-1)
    end

    it "redirects to the favorites list" do
      favorite = Favorite.create! valid_attributes
      delete :destroy, {format: :js, :id => favorite.to_param}
      expect(response).to have_http_status(200)
    end
  end

end
