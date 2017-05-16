class StopController < ApplicationController
  def stop_search
    response = @api.stop_search(params[:term])
    render json: response
  end

  def stop_search_by_line
    response = @api.stop_search_by_line(params[:line_code])
    render json: response
  end

end
