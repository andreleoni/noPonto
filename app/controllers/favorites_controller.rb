class FavoritesController < ApplicationController
  before_action :set_favorite, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :authorize_changes_or_delete, only: [:update, :destroy, :show, :edit]

  def index
    @favorites = Favorite.where(user_id: current_user.id)
  end

  def toggle_favorite
    is_favorite = params[:is_favorite]
    favorite_id = params[:favorite_id]

    if is_favorite == "false"
      @favorite = Favorite.create(name: favorite_id, user_id: current_user.id)

      if @favorite.save
        render json: { status: "success", favorite_id: favorite_id, is_favorite: "true" }
      else
        render json: { status: "failure", favorite_id: favorite_id, is_favorite: "true" }
      end
    else
      if Favorite.where(name: favorite_id, user_id: current_user.id).destroy_all
        render json: { status: "success", favorite_id: favorite_id, is_favorite: "false" }
      else
        render json: { status: "failure", favorite_id: favorite_id, is_favorite: "false" }
      end
    end
  end

  # def new
  #   @favorite = Favorite.new
  # end
  #
  # def edit
  # end

  #
  # def create
  #   @favorite = Favorite.new(favorite_params)
  #   @favorite.user_id = current_user.id
  #
  #   respond_to do |format|
  #     if @favorite.save
  #       format.html { redirect_to @favorite, notice: 'Favorite was successfully created.' }
  #       format.json { render :show, status: :created, location: @favorite }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @favorite.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end
  #
  # def update
  #   respond_to do |format|
  #     if @favorite.update(favorite_params)
  #       format.html { redirect_to @favorite, notice: 'Favorite was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @favorite }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @favorite.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end
  #
  # def destroy
  #   @favorite.destroy
  #   respond_to do |format|
  #     format.html { redirect_to favorites_url, notice: 'Favorite was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private
    def authorize_changes_or_delete
      raise "VC NAO DEVERIA ESTAR AQUI" if current_user.id != @favorite.user_id
    end

    def set_favorite
      @favorite = Favorite.find(params[:id])
    end

    def favorite_params
      params.fetch(:favorite, {}).permit(:name, :user_id)
    end
end
