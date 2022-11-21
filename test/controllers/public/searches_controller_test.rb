require "test_helper"

class Public::SearchesControllerTest < ActionDispatch::IntegrationTest
  test "should get _serach" do
    get public_searches__serach_url
    assert_response :success
  end
end
