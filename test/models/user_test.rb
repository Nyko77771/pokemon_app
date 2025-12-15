# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test 'user missing first_name is' do
    user = User.new(
      first_name: '',
      last_name: 'Doe',
      email: 'random@email.com',
      password: '1234567890'
    )
    assert user.valid?, 'User is missing first name field. Not Valid'
  end

  test 'user missing last_name' do
    user = User.new(
      first_name: 'John',
      last_name: '',
      email: 'random@email.com',
      password: '1234567890'
    )
    assert user.valid?, 'User is missing last name field. Not Valid'
  end

  test 'user missing email' do
    user = User.new(
      first_name: 'John',
      last_name: 'Doe',
      email: '',
      password: '1234567890'
    )
    assert_not user.valid?, 'User is missing email field. Not Valid'
  end

  test 'user email not unique' do
    user = User.new(
      first_name: 'John',
      last_name: 'Doe',
      email: 'john@email.com',
      password: '1234567890'
    )

    assert_not user.valid?, 'User email is not unique'
  end

  test 'user has all fields given and has unique email' do
    user = User.new(
      first_name: 'John',
      last_name: 'Doe',
      email: 'random@email.com',
      password: '1234567890'
    )

    assert user.valid?, 'User is unique'
  end
end
