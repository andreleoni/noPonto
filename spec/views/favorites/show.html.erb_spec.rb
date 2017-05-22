require 'rails_helper'

RSpec.describe "favorites/show", type: :view do
  before(:each) do
    @favorite = assign(:favorite, Favorite.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
