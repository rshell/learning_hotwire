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

module SensibleRailsStarter
  class Application < Rails::Application
    # Configure the path for configuration classes that should be used before initialization
    # NOTE: path should be relative to the project root (Rails.root)
    # config.anyway_config.autoload_static_config_path = "config/configs"
    #
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
    # Configure RSpec generators
    config.generators do |config|
      config.channel_spec false
      config.controller_spec false # Use request specs -> https://stackoverflow.com/questions/40851705/controller-specs-vs-request-specs
      config.feature_spec false # Use system tests -> https://stackoverflow.com/questions/49910032/difference-between-feature-spec-and-system-spec
      config.generator_spec true
      config.helper_spec true
      config.integration_spec true
      config.job_spec true
      config.mailbox_spec true
      config.mailer_spec true
      config.model_spec true
      config.request_spec true
      config.scaffold_spec true
      config.system_spec true
      config.view_spec true
    end

    # Load custom Rails Console configuration
    console do
      ARGV.push "-r", root.join("lib/console.rb")
    end

    config.view_component.preview_paths << "#{Rails.root}/spec/components/previews"
  end
end
