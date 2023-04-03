require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  # Change :chome with :headless_chrome, to not open on google chrome
  driven_by :selenium, using: :headless_chrome, screen_size: [1400, 1400]
end
