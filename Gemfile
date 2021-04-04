# frozen_string_literal: true

ruby '>= 2.7.0'

source 'https://rubygems.org'

# https://pages.github.com/versions/
group :development, :test do
  gem 'byebug', '~> 10.0'
  gem 'ffi', '~> 1.12.0' # 1.13.0 has issues https://github.com/ffi/ffi/issues/773
  gem 'jekyll', '~> 3.9.0'
  gem 'kramdown', '>= 2.3.1' # sec
  gem 'rubocop', '~> 0.90.0'
  gem 'webdrivers', '~> 4.4'
end

group :test do
  gem 'capybara', '~> 3.32.0'
  gem 'faraday', '~> 1.0.1'
  gem 'rspec', '~> 3.7.0'
  gem 'selenium-webdriver', '~> 3.8'
end

group :jekyll_plugins do
  gem 'github-pages'
  gem 'jekyll-paginate', '~> 1.1'
end
