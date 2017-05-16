class StopController < ApplicationController
  def stop_search
<<<<<<< HEAD
    api = SptransModule::Call.new(ENV['SPTRANS_TOKEN'])
    response = api.stop_search(params[:term])
=======
    response = @api.stop_search(params[:term])
>>>>>>> upstream/master
    render json: response
  end

  def stop_search_by_line
<<<<<<< HEAD
    api = SptransModule::Call.new(ENV['SPTRANS_TOKEN'])
    response = api.stop_search_by_line(params[:line_code])
=======
    response = @api.stop_search_by_line(params[:line_code])
>>>>>>> upstream/master
    render json: response
  end

end
