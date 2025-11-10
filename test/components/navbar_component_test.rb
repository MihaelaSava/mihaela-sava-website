require "test_helper"

class NavbarComponentTest < ViewComponent::TestCase
  test "renders brand and visible links" do
    items = [
      { name: "Home", path: "/" },
      { name: "Admin", path: "/admin", policy: ->(u) { u&.admin? } }
    ]
    html = render_inline(
      NavbarComponent.new(items:, active_path: "/", current_user: OpenStruct.new(admin?: false))
    ).to_html

    assert_includes html, "Home"
    refute_includes html, "Admin"
  end

  test "marks active link with aria-current" do
    items = [ { name: "Articole", path: "/articles" } ]
    html = render_inline(
      NavbarComponent.new(items:, active_path: "/articles", current_user: nil)
    ).to_html

    assert_includes html, 'aria-current="page"'
  end
end
