require_relative 'boot'
require 'rails/all'
require './lib/sptransapi'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)


module NoPonto
  class Application < Rails::Application#
    Dotenv::Railtie.load if ENV['RAILS_ENV'].to_s == 'development' || ENV['RAILS_ENV'].to_s == '' || ENV['RAILS_ENV'].to_s == 'test'
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
