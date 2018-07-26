require 'test_helper'

class ContentCampsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get content_camps_index_url
    assert_response :success
  end

  test "should get edit" do
    get content_camps_edit_url
    assert_response :success
  end

  test "should get update" do
    get content_camps_update_url
    assert_response :success
  end

  test "should get new" do
    get content_camps_new_url
    assert_response :success
  end

  test "should get create" do
    get content_camps_create_url
    assert_response :success
  end

  test "should get delete" do
    get content_camps_delete_url
    assert_response :success
  end

end
