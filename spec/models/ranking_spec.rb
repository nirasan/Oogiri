require 'rails_helper'

RSpec.describe Ranking, type: :model do
  before do
    @user1 = create(:user)
    @user2 = create(:user)
    @user3 = create(:user)
    @question1 = create(:question, user:@user1)
    @question2 = create(:question, user:@user1)
    @answer1 = create(:answer, user:@user1, question:@question1)
    @answer2 = create(:answer, user:@user2, question:@question1)
    @answer3 = create(:answer, user:@user3, question:@question1)
    @answer4 = create(:answer, user:@user1, question:@question2)
    create(:comment, user:@user1, answer:@answer1, rate:3)
    create(:comment, user:@user2, answer:@answer1, rate:0)
    create(:comment, user:@user3, answer:@answer1, rate:1)
    create(:comment, user:@user1, answer:@answer2, rate:1)
    create(:comment, user:@user3, answer:@answer2, rate:3)
    create(:comment, user:@user1, answer:@answer4, rate:3)
    create(:comment, user:@user2, answer:@answer4, rate:3)
    create(:comment, user:@user3, answer:@answer4, rate:3)
  end

  describe "#calc_ranking" do
    context "すでに評価済みの場合" do
      it "ランキングデータが正常に集計される" do
        expect(Ranking.calc_ranking).to match [
              {answer_id: @answer4.id, rank: 1, rate: 9},
              {answer_id: @answer1.id, rank: 2, rate: 4},
              {answer_id: @answer2.id, rank: 2, rate: 4},
            ]
      end
    end
  end

  describe "#update_ranking" do
    before do
      Ranking.update_ranking([
          {answer_id: @answer1.id, rank: 1, rate: 999},
          {answer_id: @answer4.id, rank: 2, rate: 99},
          {answer_id: @answer2.id, rank: 3, rate: 9},
        ])
    end
    context "集計済み" do
      it { expect(Ranking.find_by(rank:1)).to have_attributes(answer:@answer1, rate:999) }
      it { expect(Ranking.find_by(rank:2)).to have_attributes(answer:@answer4, rate:99) }
      it { expect(Ranking.find_by(rank:3)).to have_attributes(answer:@answer2, rate:9) }
      it { expect(Ranking.find_by(rank:4)).to eq nil }
    end
    context "再集計" do
      before do
        Ranking.update_ranking([
            {answer_id: @answer2.id, rank: 1, rate: 1000},
            {answer_id: @answer3.id, rank: 2, rate: 100},
            {answer_id: @answer4.id, rank: 3, rate: 10},
            {answer_id: @answer1.id, rank: 4, rate: 1},
          ])
      end
      it { expect(Ranking.find_by(rank:1)).to have_attributes(answer:@answer2, rate:1000) }
      it { expect(Ranking.find_by(rank:2)).to have_attributes(answer:@answer3, rate:100) }
      it { expect(Ranking.find_by(rank:3)).to have_attributes(answer:@answer4, rate:10) }
      it { expect(Ranking.find_by(rank:4)).to have_attributes(answer:@answer1, rate:1) }
    end
  end
end
