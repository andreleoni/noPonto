require 'json'

class StopController < ApplicationController
  def stop_search
    api = SptransModule::Call.new(ENV['SPTRANS_TOKEN'])
    response = api.stop_search(params[:term])
    render json: response
  end

  def stop_search_by_line
    api = SptransModule::Call.new(ENV['SPTRANS_TOKEN'])
    response = api.stop_search_by_line(params[:line_code])
    render json: response
  end

end
