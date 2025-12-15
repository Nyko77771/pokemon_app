# frozen_string_literal: true

require 'test_helper'

class ListTest < ActiveSupport::TestCase
  fixtures :lists
  # test "the truth" do
  #   assert true
  # end

  test 'name of list not present' do
    list = List.new(name: '')
    assert_not list.valid?, 'list does not have a name'
  end

  test 'List has name' do
    list = List.new(name: 'Random Name')
    assert_not list.valid?, 'list does not have a name'
  end
end
