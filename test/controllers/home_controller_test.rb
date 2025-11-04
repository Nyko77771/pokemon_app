require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get home_index_url
    assert_response :success
  end

  test "should get 404_page" do
    get home_404_page_url
    assert_response :success
  end
end
