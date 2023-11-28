require "test_helper"

class ObservationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get observations_new_url
    assert_response :success
  end

  test "should get create" do
    get observations_create_url
    assert_response :success
  end

  test "should get index" do
    get observations_index_url
    assert_response :success
  end
end
