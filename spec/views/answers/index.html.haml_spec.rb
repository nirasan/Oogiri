require 'rails_helper'

RSpec.describe "answers/index", type: :view do
  let!(:user1) { create(:user) }
  let!(:question) { create(:question, user: user1) }
  let!(:answer1) { create(:answer, user: user1, question: question, body: "answer") }
  let!(:answer2) { create(:answer, user: user1, question: question, body: "answer") }

  before do
    assign(:answers, Answer.all.page(1));
  end

  it "renders a list of answers" do
    allow(view).to receive(:current_user) { user1 }
    allow(view).to receive(:user_signed_in?) { false }
    render
    assert_select ".answer-panel > p.text-center.lead", :text => "answer", :count => 2
  end
end
