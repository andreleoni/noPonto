require_relative 'boot'
require 'rails/all'
require './lib/sptransapi'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)


module NoPonto
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    ENV['TOKEN_CONS'] = '68c53a13edefd596e8fde8044e9589a76f002fd74866a456b3313ec0815968ed'
    
  end
end
