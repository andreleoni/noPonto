class HomeController < ApplicationController
  def index
    @favorites = current_user.favorites if current_user
  end

  def search_lines
    @lines = @api.lines_to_search(params['search_input'])

    if current_user.present?
      @user_favorites = Favorite.where(user_id: current_user.id).pluck(:name)

      @lines.each_with_index do |r, i|
        if @user_favorites.include?(r["CodigoLinha"].to_s)
          @lines[i].merge!({ "isFavorite" => "true" })
        else
          @lines[i].merge!({ "isFavorite" => "false" })
        end
      end
    end

    respond_to do |format|
      format.js { render :index }
    end
  end
end
