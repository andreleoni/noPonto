require_relative 'boot'
require 'rails/all'
require './lib/sptransapi'
require './lib/gmapsapi'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module NoPonto
  class Application < Rails::Application#
    Dotenv::Railtie.load if ENV['RAILS_ENV'].to_s == 'development' || ENV['RAILS_ENV'].to_s == '' || ENV['RAILS_ENV'].to_s == 'test'
  end
end
