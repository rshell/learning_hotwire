# frozen_string_literal: true

class DemoConfig < ApplicationConfig
  attr_config :admin_user_email, :admin_user_password

  # unless Rails.env.development? || SensibleConfig.demo_instance
  #   admin_user_email = nil
  #   admin_user_password = nil
  # end
end
