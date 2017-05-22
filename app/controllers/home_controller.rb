class HomeController < ApplicationController

  def index
    @favorites = current_user.favorites if current_user
  end

  def search_lines
    @lines = @api.lines_to_search(params['search_input'])

    respond_to do |format|
      format.js { render :index }
    end
  end
end
