require 'rails_helper'

RSpec.describe "favorites/index", type: :view do
  before(:each) do
    assign(:favorites, [
      Favorite.create!(),
      Favorite.create!()
    ])
  end

  it "renders a list of favorites" do
    render
  end
end
