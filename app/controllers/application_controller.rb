class ApplicationController < ActionController::Base
  before_action :set_locale

  COUNTRY_TO_LOCALE = {
    "RO" => :ro,
    "FR" => :fr,
    "BE" => :fr,
    "CH" => :fr,
    "CA" => :fr,
    "LU" => :fr,
    "MC" => :fr
  }.freeze

  def default_url_options
    { locale: I18n.locale }
  end

  private

  def set_locale
    locale = locale_from_params || locale_from_cookie || locale_from_ip || I18n.default_locale
    I18n.locale = locale

    return unless locale_from_params

    cookies.permanent[:locale] = {
      value: locale,
      httponly: true,
      same_site: :lax
    }
  end

  def locale_from_params
    normalize_locale(params[:locale])
  end

  def locale_from_cookie
    normalize_locale(cookies[:locale])
  end

  def locale_from_ip
    country_code = country_code_from_headers || country_code_from_geocoder
    locale = COUNTRY_TO_LOCALE[country_code&.upcase]
    normalize_locale(locale)
  end

  def country_code_from_headers
    # Common reverse-proxy headers for geo-country lookups.
    request.headers["CF-IPCountry"].presence ||
      request.headers["CloudFront-Viewer-Country"].presence ||
      request.headers["X-Country-Code"].presence
  end

  def country_code_from_geocoder
    ip = request.remote_ip
    return if ip.blank?

    result = Geocoder.search(ip).first
    result&.country_code
  rescue StandardError
    nil
  end

  def normalize_locale(value)
    locale = value&.to_sym
    return unless I18n.available_locales.include?(locale)

    locale
  end
end
