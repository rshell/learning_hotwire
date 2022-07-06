class Sensibles::Header::AppTitleComponentPreview < ViewComponent::Preview
  layout "previews/header"

  # The app name & description is set via
  #
  # `config/sensibles.yml`
  #
  #  or the following environment variables:
  #
  #   `SENSIBLES_APP_NAME`
  #
  #   `SENSIBLES_APP_DESCRIPTION`
  def with_default_title
    render(Sensibles::Header::AppTitleComponent.new)
  end
end
