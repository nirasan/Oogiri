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

RSpec.describe AnswersController, type: :controller do

  let!(:user1) { create(:user) }
  let!(:question) { create(:question, user: user1) }
  let!(:answer) { create(:answer, user: user1, question:question) }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # AnswersController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all answers as @answers" do
      get :index, {}, valid_session
      expect(assigns(:answers)).to eq([answer])
    end
  end

  describe "GET #show" do
    it "assigns the requested answer as @answer" do
      get :show, {:id => answer.to_param, :question_id => question.to_param}, valid_session
      expect(assigns(:answer)).to eq(answer)
    end
  end

end
