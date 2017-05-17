class HomeController < ApplicationController

  def index

  end

  def search_lines
    @lines = @api.lines_to_search(params['search_input'])

    respond_to do |format|
      format.js { render :index }
    end
  end
end
