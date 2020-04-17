class ApplicationController < ActionController::Base
  before_action :set_locale

  def default_url_options
    {
      host: ENV["DOMAIN"] || "localhost:3000",
      locale: I18n.locale,
    }
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def locale
    default_url_options[:locale]
  end
end
