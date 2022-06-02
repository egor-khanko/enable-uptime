# frozen_string_literal: true

require_relative "boot"

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_mailbox/engine"
require "action_text/engine"
require "action_view/railtie"
require "action_cable/engine"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module EnableUptime
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # Don't generate system test files.
    config.generators.system_tests = nil

    config.autoload_paths << Rails.root.join('lib')

    config.active_job.queue_adapter = :sucker_punch

    config.action_mailer.delivery_method = :smtp
    config.action_mailer.smtp_settings = {
      address:              ENV['MAILER_ADDRESS'],
      port:                 ENV['MAILER_PORT'],
      domain:               ENV['MAILER_DOMAIN'],
      user_name:            ENV['MAILER_USERNAME'],
      password:             ENV['MAILER_PASSWORD'],
      authentication:       'plain',
      enable_starttls_auto: true,
      open_timeout:         5,
      read_timeout:         5
    }
  end
end
