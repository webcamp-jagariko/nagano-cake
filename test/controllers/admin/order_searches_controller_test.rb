require "test_helper"

class Admin::OrderSearchesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get admin_order_searches_show_url
    assert_response :success
  end
end
