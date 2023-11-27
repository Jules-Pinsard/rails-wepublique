require "test_helper"

class SubCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get sub_comments_create_url
    assert_response :success
  end

  test "should get destroy" do
    get sub_comments_destroy_url
    assert_response :success
  end
end
