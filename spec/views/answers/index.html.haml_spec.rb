require 'rails_helper'

RSpec.describe "answers/index", type: :view do
  before(:each) do
    assign(:answers, [
      Answer.create!(
        :user => nil,
        :question => nil,
        :body => "MyText",
        :category => "Category"
      ),
      Answer.create!(
        :user => nil,
        :question => nil,
        :body => "MyText",
        :category => "Category"
      )
    ])
  end

  it "renders a list of answers" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Category".to_s, :count => 2
  end
end
