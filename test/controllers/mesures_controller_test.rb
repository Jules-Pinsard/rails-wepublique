require "test_helper"

class MesuresControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get mesures_index_url
    assert_response :success
  end

  test "should get show" do
    get mesures_show_url
    assert_response :success
  end

  test "should get new" do
    get mesures_new_url
    assert_response :success
  end

  test "should get create" do
    get mesures_create_url
    assert_response :success
  end

  test "should get update" do
    get mesures_update_url
    assert_response :success
  end

  test "should get destroy" do
    get mesures_destroy_url
    assert_response :success
  end
end
