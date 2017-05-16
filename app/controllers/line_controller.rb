class LineController < ApplicationController

  def search_lines
<<<<<<< HEAD
    api = SptransModule::Call.new(ENV['SPTRANS_TOKEN'])
    response = api.lines_to_search(params[:term])
=======
    response = @api.lines_to_search(params[:term])
>>>>>>> upstream/master
    render json: response
  end

  def load_line_details
<<<<<<< HEAD
    api = SptransModule::Call.new(ENV['SPTRANS_TOKEN'])
    response = api.lines_load_details(params[:line_code])
=======
    response = @api.lines_load_details(params[:line_code])
>>>>>>> upstream/master
    render json: response
  end

end
