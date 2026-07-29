require "test_helper"
require "ostruct"

class ApplicationLocaleTest < ActionDispatch::IntegrationTest
  test "uses locale from URL param and persists it in cookie" do
    get root_path(locale: :fr)

    assert_response :success
    assert_equal "fr", cookies[:locale]
  end

  test "uses locale from cookie when URL locale is missing" do
    cookies[:locale] = "ro"

    get root_path

    assert_response :success
    assert_equal :ro, I18n.locale
  end

  test "uses country header for IP locale detection" do
    get root_path, headers: { "CF-IPCountry" => "ro" }

    assert_response :success
    assert_equal :ro, I18n.locale
  end

  test "falls back to default locale when country cannot be resolved" do
    with_stubbed_geocoder_search([]) do
      get root_path

      assert_response :success
      assert_equal I18n.default_locale, I18n.locale
    end
  end

  test "URL locale has priority over cookie and IP" do
    cookies[:locale] = "ro"

    get root_path(locale: :en), headers: { "CF-IPCountry" => "FR" }

    assert_response :success
    assert_equal :en, I18n.locale
    assert_equal "en", cookies[:locale]
  end

  test "uses geocoder country code when proxy headers are missing" do
    geocoder_result = OpenStruct.new(country_code: "FR")

    with_stubbed_geocoder_search([ geocoder_result ]) do
      get root_path

      assert_response :success
      assert_equal :fr, I18n.locale
    end
  end

  private

  def with_stubbed_geocoder_search(result)
    original_method = Geocoder.method(:search)
    Geocoder.define_singleton_method(:search) { |_ip| result }
    yield
  ensure
    Geocoder.define_singleton_method(:search, original_method)
  end
end
