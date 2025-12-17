# frozen_string_literal: true

require 'test_helper'

class AuthenticationFlowTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  # Initial custom user setup
  setup do
    @user = users(:one)
  end

  # Test to see if user will be able to signup
  # Should be successfull signup
  test 'user signup attempt' do
    post users_path, params: {
      user: {
        first_name: @user.first_name,
        last_name: @user.last_name,
        email: @user.email
      },
      password: 'pass123'
    }
    assert_response :success
  end

  # Test to see if user will be redirected to home page
  # Should be successfull login
  test 'user signin attempt' do
    post login_path, params: {
      session: {
        email: @user.email,
        password: '1234567890'
      }
    }
    assert_redirected_to root_path
  end

  # Test to see if user will be redirected to login page
  # Should not be able to login
  test 'user signin attempt but different password' do
    post login_path, params: {
      session: {
        email: @user.email,
        password: 'differentpassword'
      }
    }
    assert_redirected_to login_path
  end

  # Test to see if user will be redirected to login page
  # Should not be able to login
  test 'user signin attempt but no password' do
    post login_path, params: {
      session: {
        email: @user.email,
        password: nil
      }
    }
    assert_redirected_to login_path
  end

  # Test to see if user will be redirected to login page
  # Should not be able to login
  test 'user signin attempt but no email' do
    post login_path, params: {
      session: {
        email: nil,
        password: '1234567890'
      }
    }
    assert_redirected_to login_path
  end

  # Test to see if user can logout
  # Should not be able to logout
  test 'user logout attempt' do
    post login_path, params: {
      session: {
        email: @user.email,
        password: nil
      }
    }
    delete logout_path
    assert_response :success
  end
end
