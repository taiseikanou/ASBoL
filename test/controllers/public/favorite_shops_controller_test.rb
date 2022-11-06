require "test_helper"

class Public::FavoriteShopsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_favorite_shops_index_url
    assert_response :success
  end

  test "should get show" do
    get public_favorite_shops_show_url
    assert_response :success
  end
end
