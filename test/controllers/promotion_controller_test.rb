require "test_helper"

class PromotionControllerTest < ActionDispatch::IntegrationTest
  test "should get add" do
    get promotion_add_url
    assert_response :success
  end

  test "should get update" do
    get promotion_update_url
    assert_response :success
  end

  test "should get remove" do
    get promotion_remove_url
    assert_response :success
  end

  test "should get get" do
    get promotion_get_url
    assert_response :success
  end
end
