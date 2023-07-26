require "test_helper"

class Public::GenreSearchesControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get public_genre_searches_search_url
    assert_response :success
  end
end
