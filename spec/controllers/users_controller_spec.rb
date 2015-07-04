require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  let!(:user1) { create(:user) }
  let!(:user2) { create(:user) }
  let!(:question1) { create(:question, user: user1) }
  let!(:question2) { create(:question, user: user2) }
  let!(:question3) { create(:question, user: user1) }
  let!(:answer1) { create(:answer, user: user1, question:question1) }
  let!(:answer2) { create(:answer, user: user1, question:question2) }
  let!(:answer3) { create(:answer, user: user1, question:question3) }
  let!(:answer4) { create(:answer, user: user2, question:question1) }
  let!(:answer5) { create(:answer, user: user2, question:question2) }
  let!(:answer6) { create(:answer, user: user2, question:question3) }
  let!(:comment1) { create(:comment, user: user1, answer:answer1) }
  let!(:comment2) { create(:comment, user: user1, answer:answer5) }
  let!(:comment3) { create(:comment, user: user2, answer:answer6) }
  let!(:comment4) { create(:comment, user: user2, answer:answer2) }
  let!(:comment5) { create(:comment, user: user2, answer:answer1) }
  let!(:comment6) { create(:comment, user: user1, answer:answer6) }
  let!(:favorite) { create(:favorite, from_user_id:user1.to_param, to_user_id:user2.to_param)}

  describe "GET #show" do
    it "user1 の questions, answers, comments がセットされている" do
      get :show, {id: user1.to_param}
      expect(assigns(:questions)).to eq([question3, question1])
      expect(assigns(:answers)).to eq([answer3, answer2, answer1])
      expect(assigns(:comments)).to eq([comment6, comment2, comment1])
    end

    it "user2 の questions, answers, comments がセットされている" do
      get :show, {id: user2.to_param}
      expect(assigns(:questions)).to eq([question2])
      expect(assigns(:answers)).to eq([answer6, answer5, answer4])
      expect(assigns(:comments)).to eq([comment5, comment4, comment3])
    end
  end

  describe "GET #questions" do
    it "user1 の questions がセットされている" do
      get :questions, {id: user1.to_param}
      expect(assigns(:questions)).to eq([question3, question1])
    end
  end

  describe "GET #answers" do
    it "user1 の answers がセットされている" do
      get :show, {id: user1.to_param}
      expect(assigns(:answers)).to eq([answer3, answer2, answer1])
    end
  end

  describe "GET #comments" do
    it "user1 の comments がセットされている" do
      get :show, {id: user1.to_param}
      expect(assigns(:comments)).to eq([comment6, comment2, comment1])
    end
  end

  describe "GET #favorite_users" do
    it "user1 の favorite_users がセットされている" do
      get :favorite_users, {id: user1.to_param}
      expect(assigns(:favorite_users)).to eq([user2])
    end
  end

  describe "GET #favorited_users" do
    it "user2 の favorited_users がセットされている" do
      get :favorited_users, {id: user2.to_param}
      expect(assigns(:favorited_users)).to eq([user1])
    end
  end

end
