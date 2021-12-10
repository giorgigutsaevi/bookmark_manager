# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

ruby '3.0.0'
group :test do
  gem 'simplecov', require: false
  gem 'simplecov-console', require: false
end

group :development, :test do
  gem 'rspec'
  gem 'rubocop', '1.23.0'
  gem 'webrick'
  gem 'capybara'

end

gem "pg", "~> 1.2"
gem "sinatra", "~> 2.1"
gem "sinatra-contrib", "~> 2.1"
gem "sinatra-flash", "~> 0.3.0"
