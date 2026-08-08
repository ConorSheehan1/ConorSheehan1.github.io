# frozen_string_literal: true

ruby ">= 2.7.0"

source "https://rubygems.org"

# https://pages.github.com/versions/
group :development, :test do
  gem "byebug"
  gem "ffi"
  gem "jekyll", "~> 3.9.0"
  gem "kramdown", ">= 2.3.1" # sec
  gem "rubocop", "~> 0.90.0"
  gem "webdrivers", "~> 4.6.0" # 4.7.0 execute_script to reset local storage for theme tests fails
end

group :test do
  gem "capybara", "~> 3.32.0"
  gem "faraday", "~> 1.0.1"
  gem "rspec", "~> 3.7.0"
  gem "selenium-webdriver", "~> 3.8"
end

group :jekyll_plugins do
  gem "github-pages"
  gem "jekyll-feed", "~> 0.15.1"
  gem "jekyll-paginate", "~> 1.1"
  gem "jekyll-sitemap", "~> 1.4"
  gem "jekyll-tagging", "~> 1.1"
end
