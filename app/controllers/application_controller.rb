# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_locale

  def default_url_options
    return {} if I18n.locale == I18n.default_locale

    { lang: I18n.locale }
  end

  private

  def after_sign_in_path_for(resource)
    if resource.is_a?(Admin)
      admin_tests_path
    else
      root_path
    end
  end

  def set_locale
    I18n.locale = I18n.locale_available?(params[:lang]) ? params[:lang] : I18n.default_locale
  end
end
