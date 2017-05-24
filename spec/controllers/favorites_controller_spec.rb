require 'rails_helper'
require 'devise'

RSpec.describe FavoritesController, type: :controller do
  before(:each) do
    @user = User.create!(name: "João", password: "joao123", password_confirmation: "joao123", email: "andreluizleoni@gmail.com")
    sign_in @user
  end

  let(:valid_attributes) {
    skip({ user_id: @user.id, name: "MyFavorite" })
  }

  let(:invalid_attributes) {
    skip({ user_id: nil, name: "MyFavorite" })
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      # favorite = Favorite.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      favorite = Favorite.create! valid_attributes
      get :show, params: {id: favorite.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      favorite = Favorite.create! valid_attributes
      get :edit, params: {id: favorite.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Favorite" do
        expect {
          post :create, params: {favorite: valid_attributes}, session: valid_session
        }.to change(Favorite, :count).by(1)
      end

      it "redirects to the created favorite" do
        post :create, params: {favorite: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Favorite.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {favorite: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested favorite" do
        favorite = Favorite.create! valid_attributes
        put :update, params: {id: favorite.to_param, favorite: new_attributes}, session: valid_session
        favorite.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the favorite" do
        favorite = Favorite.create! valid_attributes
        put :update, params: {id: favorite.to_param, favorite: valid_attributes}, session: valid_session
        expect(response).to redirect_to(favorite)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        favorite = Favorite.create! valid_attributes
        put :update, params: {id: favorite.to_param, favorite: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested favorite" do
      favorite = Favorite.create! valid_attributes
      expect {
        delete :destroy, params: {id: favorite.to_param}, session: valid_session
      }.to change(Favorite, :count).by(-1)
    end

    it "redirects to the favorites list" do
      favorite = Favorite.create! valid_attributes
      delete :destroy, params: {id: favorite.to_param}, session: valid_session
      expect(response).to redirect_to(favorites_url)
    end
  end

end
