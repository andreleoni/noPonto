require 'json'

class LineController < ApplicationController

  def search_lines
    api = SptransModule::Call.new(ENV["TOKEN_CONS"])
    response = api.lines_to_search(params[:term])
    render json: response
  end

  def load_line_details
    api = SptransModule::Call.new(ENV["TOKEN_CONS"])
    response = api.lines_load_details(params[:line_code])
    render json: response
  end

end
