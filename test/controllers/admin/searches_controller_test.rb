require "test_helper"

class Admin::SearchesControllerTest < ActionDispatch::IntegrationTest
  test "should get _serach" do
    get admin_searches__serach_url
    assert_response :success
  end
end
