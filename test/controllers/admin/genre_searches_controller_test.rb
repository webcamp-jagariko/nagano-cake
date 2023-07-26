require "test_helper"

class Admin::GenreSearchesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get admin_genre_searches_show_url
    assert_response :success
  end
end
