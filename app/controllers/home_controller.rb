class HomeController < ApplicationController

  def search_lines
    sptrans = SptransModule::Call.new(ENV['SPTRANS_TOKEN'])
    @lines = sptrans.lines_to_search(params['search_input'])
    respond_to do |format|
      format.js { render :index }
    end
  end
end
