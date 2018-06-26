require 'rspec'
require 'capybara/rspec'
require 'rack/jekyll'
require 'rack/test'
require 'pry'
require 'yaml'
require "faraday"

Dir["#{__dir__}/support/**/*.rb"].each { |f| require f }

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.before :all do
    # @local_host = 'http://127.0.0.1'
    @home_page_regex =/http\:\/\/127\.0\.0\.1\:(\d+)\//
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  Capybara.register_driver :selenium do |app|
    Capybara::Selenium::Driver.new(app, :browser => :chrome)
  end

  # Configure Capybara to load the website through rack-jekyll.
  # (force_build: true) builds the site before the tests are run,
  # so the tests are always running against the latest version of the site.
  Capybara.app = Rack::Jekyll.new(force_build: true)
end
