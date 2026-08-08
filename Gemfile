# frozen_string_literal: true

ruby ">= 2.7.0"

source "https://rubygems.org"

# https://pages.github.com/versions/ dead :(
# see https://ritviknag.com/tech-tips/ruby-versioning-hell-with-jekyll-&-github-pages/
group :development, :test do
  gem "byebug"
  gem "ffi"
  gem "jekyll", "~> 3.9.0"
  gem "kramdown", ">= 2.3.1" # sec
  gem "rubocop"
  gem "webdrivers", "~> 4.6.0" # 4.7.0 execute_script to reset local storage for theme tests fails
  gem "webrick"
  gem "matrix"
end

group :test do
  gem "capybara", "~> 3.32.0"
  gem "faraday", "~> 1.0.1"
  gem "rspec", "~> 3.7.0"
  gem "cuprite"
end

group :jekyll_plugins do
  gem "github-pages"
  gem "jekyll-feed", "~> 0.15.1"
  gem "jekyll-paginate", "~> 1.1"
  gem "jekyll-sitemap", "~> 1.4"
  gem "jekyll-tagging", "~> 1.1"
end
