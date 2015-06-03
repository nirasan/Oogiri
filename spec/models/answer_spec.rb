require 'rails_helper'

RSpec.describe Answer, type: :model do
  describe "#sum_of_rate" do
    let!(:user1) { create(:user) }
    let!(:user2) { create(:user) }
    let!(:user3) { create(:user) }
    let!(:question) { create(:question, user: user1) }
    let!(:answer) { create(:answer, user: user1, question: question) }
    let!(:comment1) { create(:comment, user: user1, answer: answer, rate: 1) }
    let!(:comment2) { create(:comment, user: user2, answer: answer, rate: 3) }
    let!(:comment3) { create(:comment, user: user3, answer: answer, rate: 2) }
    context "すでに評価済みの場合" do
      it "Comment.rate の合計値を得る" do
        expect(answer.sum_of_rate).to eq 6
      end
    end
  end
end
