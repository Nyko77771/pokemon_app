require "test_helper"

class UserControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  
  test "get the signup page" do
    get signup_url
    assert_response :success
  end 
end
