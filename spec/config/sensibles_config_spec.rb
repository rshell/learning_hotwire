# frozen_string_literal: true

require "rails_helper"

RSpec.describe SensiblesConfig, type: :config do
  subject { described_class.new }

  context "required" do
    it do
      with_env(
        "SENSIBLES_APP_NAME" => "",
        "SENSIBLES_APP_DESCRIPTION" => "",
        "SENSIBLES_APP_HOST" => ""
      ) do
        expect { subject }.to raise_error(/missing or empty: app_name, app_description, app_host/)
      end
    end
  end

  it do
    with_env(
      "SENSIBLES_APP_NAME" => "FooBar",
      "SENSIBLES_APP_DESCRIPTION" => "This app foos the bar...",
      "SENSIBLES_APP_HOST" => "http://example.com",
      "SENSIBLES_APP_PORT" => "8080",
      "SENSIBLES_DEMO_INSTANCE" => "true"
    ) do
      is_expected.to have_attributes(
        app_name: "FooBar",
        app_description: "This app foos the bar...",
        app_host: "http://example.com",
        app_port: 8080,
        demo_instance: true
      )
    end
  end
end
