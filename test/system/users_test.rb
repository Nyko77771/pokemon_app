# frozen_string_literal: true

require 'application_system_test_case'
require 'webdrivers'
require 'selenium-webdriver'

class UsersTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
  end

  test 'visiting the home page' do
    visit root_path
    assert_selector 'h1', text: 'Welcome to Pokemon App'
  end

  test 'visiting about page' do
    visit about_path
    assert_selector 'h2', text: 'About Me'
    assert_selector 'h2', text: 'My Mission'
  end

  test 'visiting faq page' do
    visit faq_path
    assert_selector 'h5', text: ' General Questions '
    assert_selector 'h5', text: ' App Features Questions '
  end

  test 'user signup' do
    visit signup_path
    fill_in 'First Name', with: @user.first_name
    fill_in 'Last Name', with: @user.last_name
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: '1234567890'
    click_on 'Sign up'

    assert_text 'User successfully created.'
  end

  test 'user login' do
    visit login_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: '1234567890'
    click_on 'Login'
    assert_text 'Successfully logged in'
  end

  test 'user profile page' do
    visit login_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: '1234567890'
    click_on 'Login'
    visit profile_path
    assert_text user.first_name
    assert_text user.last_name
    assert_text user.email
  end

  test 'user update email successfully' do
    visit login_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: '1234567890'
    click_on 'Login'
    visit edit_user_path(@user)
    fill_in 'Email', with: 'newjohn@email.com'
    click_on 'Update'
    assert_text 'Email successfully updated.'
  end
end
