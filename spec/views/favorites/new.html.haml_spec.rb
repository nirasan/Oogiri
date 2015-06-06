require 'rails_helper'

RSpec.describe "favorites/new", type: :view do
  before(:each) do
    assign(:favorite, Favorite.new(
      :from_user_id => 1,
      :to_user_id => 1
    ))
  end

  it "renders new favorite form" do
    render

    assert_select "form[action=?][method=?]", favorites_path, "post" do

      assert_select "input#favorite_from_user_id[name=?]", "favorite[from_user_id]"

      assert_select "input#favorite_to_user_id[name=?]", "favorite[to_user_id]"
    end
  end
end
