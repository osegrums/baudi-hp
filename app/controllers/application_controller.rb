class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_locale, :set_active_nav_tab

  def allowed_locales
    %w{en lv ru}
  end
  helper_method :allowed_locales

  def set_locale
    param_locale = allowed_locales.find{ |l| l == params[:locale]}

    session[:locale] = param_locale || session[:locale] || I18n.default_locale
    I18n.locale = session[:locale]
  end

  def set_active_nav_tab
    @active_nav_tab = :home
  end
end
