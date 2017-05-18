class StopController < ApplicationController
  def stop_search
    response = @api.stop_search(params[:term])
    render json: response
  end

  def stop_search_by_line
    response = @api.stop_search_by_line(params[:line_code])
    respond_to do |format|
      format.js { render json: JSON.parse(response.body) }
    end
  end

end
