require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get about" do
    get pages_about_url
    assert_response :success
  end

  test "should get botany_projects" do
    get pages_botany_projects_url
    assert_response :success
  end

  test "should get programming_projects" do
    get pages_programming_projects_url
    assert_response :success
  end

  test "should get contact" do
    get pages_contact_url
    assert_response :success
  end
end
