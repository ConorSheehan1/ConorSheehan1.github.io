# frozen_string_literal: true

require "rspec"
require "capybara/rspec"
require "capybara/cuprite"
require "yaml"
require "faraday"

Capybara.register_driver(:cuprite_headless) do |app|
  Capybara::Cuprite::Driver.new(app,
                                headless: true,
                                window_size: [1400, 1400],
                                browser_options: {
                                  "no-sandbox" => nil,
                                  "disable-gpu" => nil,
                                  "disable-dev-shm-usage" => nil
                                })
end

Capybara.default_driver = :cuprite_headless
Capybara.javascript_driver = :cuprite_headless

Dir["#{__dir__}/support/**/*.rb"].each { |f| require f }

RSpec.configure do |config|
  config.expect_with(:rspec) do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.before(:all) do
    @home_page_regex = %r{http://(127\.0\.0\.1|localhost):(\d+)/}
  end

  config.mock_with(:rspec) do |mocks|
    mocks.verify_partial_doubles = true
  end

  Capybara.configure do |cap|
    cap.run_server = false
    cap.app_host = "http://127.0.0.1:4000"
  end
end
