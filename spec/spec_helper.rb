# frozen_string_literal: true

require "rspec"
require "capybara/rspec"
require "yaml"
require "faraday"
require "webdrivers"
require "selenium/webdriver"

Dir["#{__dir__}/support/**/*.rb"].sort.each { |f| require f }

RSpec.configure do |config|
  config.expect_with(:rspec) do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.before(:all) do
    @home_page_regex = %r{http://127\.0\.0\.1:(\d+)/}
    @theme_github_link = "https://github.com/pages-themes/midnight"
    @theme_twitter_link = "https://twitter.com/michigangraham"
  end

  config.mock_with(:rspec) do |mocks|
    mocks.verify_partial_doubles = true
  end

  Capybara.current_driver = :selenium_chrome_headless
  Capybara.configure do |cap|
    # Calling current_driver= from Capybara.configure is deprecated
    cap.javascript_driver = :selenium_chrome_headless
    cap.run_server = false
    cap.app_host = "http://127.0.0.1:4000"
  end
end
