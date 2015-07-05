require 'rails_helper'

RSpec.feature "Comments", type: :feature do

  let(:password) { 'password' }
  let!(:user1) { create(:user, password: password) }
  let!(:question) { create(:question, user: user1) }
  let!(:answer) { create(:answer, user: user1, question:question) }

  describe "POST comment", js: true do
    it "works!" do
      login(user1.email, password)

      visit answers_path
      el = find("#comment-form-#{answer.id}")
      el.find("label[for=comment_rate_#{answer.id}_3]").click
      el.find("input[type=text]").set('NEW COMMENT')
      el.find("button.btn-primary").click
      wait_for_ajax
      expect(page).to have_content("コメントしました")
    end
  end
end
