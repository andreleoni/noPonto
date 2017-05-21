require "rails_helper"

RSpec.describe FavoritesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/favorites").to route_to("favorites#index")
    end

    it "routes to #new" do
      expect(:get => "/favorites/new").to route_to("favorites#new")
    end

    it "routes to #show" do
      expect(:get => "/favorites/1").to route_to("favorites#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/favorites/1/edit").to route_to("favorites#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/favorites").to route_to("favorites#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/favorites/1").to route_to("favorites#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/favorites/1").to route_to("favorites#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/favorites/1").to route_to("favorites#destroy", :id => "1")
    end

  end
end
