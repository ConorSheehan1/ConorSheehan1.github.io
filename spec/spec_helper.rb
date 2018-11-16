# frozen_string_literal: true

require 'rspec'
require 'capybara/rspec'
require 'rack/jekyll'
require 'rack/test'
require 'yaml'
require 'faraday'

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

  Capybara.register_driver :selenium do |app|
    Capybara::Selenium::Driver.new(app, browser: :chrome)
  end

  # https://gist.github.com/deanmarano/aeae5cd2d357fec1b06e30ead397d4e3
  # Configure Capybara to load the website through rack-jekyll.
  # (force_build: true) builds the site before the tests are run,
  # so the tests are always running against the latest version of the site.
  Capybara.app = Rack::Jekyll.new(force_build: true)

  # Capybara.server = :webrick
  # Capybara.run_server = false
  # Capybara.register_server :jekyll do |app, port, host|
  #   Rack::Jekyll.new(force_build: true)
  # end
  # Capybara.server = :jekyll
  # Capybara.register_server :puma do |app, port, host|
  #   # require 'rack/handler/webrick'
  #   # Rack::Handler::WEBrick.run(Capybara.app)
  #   require 'puma'
  #   Puma.run(Rack::Jekyll.new(force_build: true))
  # end
  Capybara.server = :webrick
end
