require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get about" do
    get about_url
    assert_response :success
  end

  test "should get botany_projects" do
    get botany_projects_url
    assert_response :success
  end

  test "should get dev_projects" do
    get dev_projects_url
    assert_redirected_to dev_etymology_url
  end

  test "should get contact" do
    get contact_url
    assert_response :success
  end
end
