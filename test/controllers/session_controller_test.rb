# frozen_string_literal: true

require 'test_helper'

class SessionControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test 'get login page' do
    get login_url
    assert_response :success
  end
end
