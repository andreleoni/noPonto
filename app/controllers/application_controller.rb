class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_api

  private 

  def set_api
    @api = SptransModule::Call.new(ENV['SPTRANS_TOKEN'])
  end
end
