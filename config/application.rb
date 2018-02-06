require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
require "attachinary/orm/active_record"

# require "rails/test_unit/railtie"

config.action_mailer.delivery_method = :postmark
config.action_mailer.postmark_settings = { :api_token => "bb9529de-52e8-42fc-9544-4ce8e2a66449" }

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Troveko
  class Application < Rails::Application
    config.generators do |generate|
      generate.assets false
      generate.helper false
    end

    # Initialize configuration defaults for originally generated Rails version.
    # config.load_defaults 5.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Don't generate system test files.
    config.generators.system_tests = nil
  end
end
