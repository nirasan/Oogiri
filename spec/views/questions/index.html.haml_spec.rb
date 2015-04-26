require 'rails_helper'

RSpec.describe "questions/index", type: :view do
  before(:each) do
    assign(:questions, [
      Question.create!(
        :user_id => 1,
        :title => "Title",
        :category => "Category"
      ),
      Question.create!(
        :user_id => 1,
        :title => "Title",
        :category => "Category"
      )
    ])
  end

  it "renders a list of questions" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Category".to_s, :count => 2
  end
end
