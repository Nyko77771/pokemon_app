require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get home_index_url
    assert_response :success
  end

  test "should get 404_page" do
    get home_404_page_url
    assert_response :not_found
  end

  test "get the about page" do
    get about_url
    assert_response :success
  end

  test "get faq page" do
    get faq_url
    assert_response :success
  end

  test "get result page" do
    get result_url
    assert_response :success
  end
end
