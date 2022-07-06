# frozen_string_literal: true

class MailConfig < ApplicationConfig
  class MailConfigNotSet < StandardError; end

  attr_config :delivery_method,
    :host,
    :address,
    :port,
    :user_name,
    :password,
    :authentication,
    :enable_starttls_auto,
    :perform_deliveries

  if Rails.env.production?
    required :delivery_method,
      :host,
      :address,
      :port,
      :user_name,
      :password,
      :authentication,
      :enable_starttls_auto
  end
end
