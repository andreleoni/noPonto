class LineController < ApplicationController
  def search_lines
    response = @api.lines_to_search(params[:term])
    render json: response
  end

  def load_line_details
    response = @api.lines_load_details(params[:line_code])
    render json: response
  end

  def vehicles_position
    response = @api.vehicles_position(params[:line_code])

    respond_to do |format|
      format.js { render json: JSON.parse(response.body) }
    end
  end
end
