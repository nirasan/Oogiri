require 'rails_helper'

RSpec.describe "favorites/edit", type: :view do
  before(:each) do
    @favorite = assign(:favorite, Favorite.create!(
      :from_user_id => 1,
      :to_user_id => 1
    ))
  end

  it "renders the edit favorite form" do
    render

    assert_select "form[action=?][method=?]", favorite_path(@favorite), "post" do

      assert_select "input#favorite_from_user_id[name=?]", "favorite[from_user_id]"

      assert_select "input#favorite_to_user_id[name=?]", "favorite[to_user_id]"
    end
  end
end
