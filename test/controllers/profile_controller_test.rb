require 'test_helper'

class ProfileControllerTest < ActionDispatch::IntegrationTest
  test 'should get view' do
    get profile_view_url
    assert_response :success
  end

  test 'should get edit' do
    get profile_edit_url
    assert_response :success
  end

  test 'should get upload' do
    get profile_upload_url
    assert_response :success
  end
end
