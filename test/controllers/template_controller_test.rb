require "test_helper"

class TemplateControllerTest < ActionDispatch::IntegrationTest
  test "should get view" do
    get template_view_url
    assert_response :success
  end

  test "should get list" do
    get template_list_url
    assert_response :success
  end
end
