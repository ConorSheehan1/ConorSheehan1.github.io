# frozen_string_literal: true

require 'rspec'
require 'capybara/rspec'
require 'yaml'
require 'faraday'
require 'selenium/webdriver'

Dir["#{__dir__}/support/**/*.rb"].each { |f| require f }

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.before :all do
    @home_page_regex = %r{http\:\/\/127\.0\.0\.1\:(\d+)\/}
    @theme_link = 'https://twitter.com/michigangraham'
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  Capybara.register_driver :headless_chrome do |app|
    capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
      chromeOptions: { args: %w[headless disable-gpu no-sandbox port=4000] }
    )

    Capybara::Selenium::Driver.new app,
                                   browser: :chrome,
                                   desired_capabilities: capabilities
  end

  Capybara.configure do |cap|
    cap.current_driver = :headless_chrome
    cap.javascript_driver = :headless_chrome
    cap.run_server = false
    cap.app_host   = 'http://127.0.0.1:4000'
  end

  # rubocop:disable Metrics/LineLength
  # https://gist.github.com/deanmarano/aeae5cd2d357fec1b06e30ead397d4e3
  # Configure Capybara to load the website through rack-jekyll.
  # (force_build: true) builds the site before the tests are run,
  # so the tests are always running against the latest version of the site.

  # Capybara.app = Rack::Jekyll.new(force_build: true, config: "#{__dir__}/../_config.yml")
  # force build not reading _config.yml? raising exception
  # cannot load such file -- ConorSheehan1.github.io/_layouts/spec/data/images_spec.rb
  # rubocop:enable Metrics/LineLength
end
