# frozen_string_literal: true

require "rails_helper"

RSpec.describe Sensibles::Header::AppTitleComponent, type: :component do
  include Anyway::Testing::Helpers

  before :each do
    render_inline(described_class.new)
  end

  context "environment variables not set" do
    it "should render the fallback app name" do
      SensiblesConfig.app_name = nil
      SensiblesConfig.app_description = ""
      expect(render_inline(described_class.new).to_html).to have_text(/No app name has been set No app description has been set/)
    end
  end
end
