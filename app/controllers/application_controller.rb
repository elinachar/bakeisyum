class ApplicationController < ActionController::Base
  before_action :set_locale
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_url, alert: exception.message
  end


  def default_url_options(options={})
    # { locale: I18n.locale }
    (I18n.locale.to_sym.eql?(I18n.default_locale.to_sym) ? {} : {locale: I18n.locale}).merge options
  end

  private

  def set_locale
    # I18n.locale = extract_locale || I18n.default_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def extract_locale
    parsed_locale = params[:locale]
    I18n.available_locales.map(&:to_s).include?(parsed_locale) ? parsed_locale : nil
  end


end
