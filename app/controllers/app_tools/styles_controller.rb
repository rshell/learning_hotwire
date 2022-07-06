class AppTools::StylesController < ApplicationController
  before_action :authenticate_admin!

  layout "app_tools"

  def index
  end

  def tailwindcss
  end
end
