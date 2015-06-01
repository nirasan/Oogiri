require 'rails_helper'

RSpec.describe "comments/new", type: :view do
  before(:each) do
    assign(:comment, Comment.new(
      :user => nil,
      :answer => nil,
      :body => "MyText",
      :rate => 1
    ))
  end

  it "renders new comment form" do
    render

    assert_select "form[action=?][method=?]", comments_path, "post" do

      assert_select "input#comment_user_id[name=?]", "comment[user_id]"

      assert_select "input#comment_answer_id[name=?]", "comment[answer_id]"

      assert_select "textarea#comment_body[name=?]", "comment[body]"

      assert_select "input#comment_rate[name=?]", "comment[rate]"
    end
  end
end
