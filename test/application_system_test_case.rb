# frozen_string_literal: true

require 'test_helper'
require 'selenium-webdriver'

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :selenium, using: :firefox, screen_size: [1400, 1400]
end
