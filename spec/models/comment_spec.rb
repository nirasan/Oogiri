require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe "#update_answer_sum_of_rate" do
    let!(:user1) { create(:user) }
    let!(:user2) { create(:user) }
    let!(:question) { create(:question, user: user1) }
    let!(:answer) { create(:answer, user: user1, question: question) }
    context "Answer作成済み" do
      it "Commentの登録更新削除でAnswer.sum_of_rateが更新される" do
        expect{@comment1 = create(:comment, user:user1, answer:answer, rate:3)}
          .to change{Answer.find(answer.id).sum_of_rate}.to(3)
        expect{@comment2 = create(:comment, user:user2, answer:answer, rate:2)}
          .to change{Answer.find(answer.id).sum_of_rate}.to(5)
        expect{@comment2.update(rate:1)}
          .to change{Answer.find(answer.id).sum_of_rate}.to(4)
        expect{@comment1.destroy}
          .to change{Answer.find(answer.id).sum_of_rate}.to(1)
      end
    end
  end
end
