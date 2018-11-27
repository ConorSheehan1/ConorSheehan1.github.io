# frozen_string_literal: true

ruby '>= 2.3.0'

source 'https://rubygems.org'

group :development, :test do
  gem 'puma', '~> 3.12'
  gem 'rack', '>= 2.0.6'
  # https://github.com/adaoraul/rack-jekyll/issues/56
  gem 'rack-jekyll', git: 'https://github.com/adaoraul/rack-jekyll',
                     ref: 'e6ae4a588c2d881bccc35368e9cc81fe745a2b99'
  gem 'rubocop', '~> 0.57.2'
end

group :test do
  gem 'byebug', '~> 10.0'
  gem 'capybara', '~> 2.17.0'
  gem 'chromedriver-helper', '~> 1.1.0'
  gem 'faraday', '~> 0.13.1'
  gem 'rspec', '~> 3.7.0'
  gem 'selenium-webdriver', '~> 3.8'
end

group :jekyll_plugins do
  gem 'github-pages', '172'
  gem 'jekyll-paginate', '~> 1.1'
end
