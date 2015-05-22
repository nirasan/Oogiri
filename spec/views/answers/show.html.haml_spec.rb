require 'rails_helper'

RSpec.describe "answers/show", type: :view do
  before(:each) do
    @answer = assign(:answer, Answer.create!(
      :user => nil,
      :question => nil,
      :body => "MyText",
      :category => "Category"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Category/)
  end
end
