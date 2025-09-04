# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby(File.read(File.join(File.dirname(__FILE__), '.ruby-version')).strip)

gem 'activeadmin', '~> 2.9'
gem 'activeadmin_addons', '~> 1.9.0'
gem 'aws-sdk-s3', '~> 1.114.0'
gem 'bootsnap', '~> 1.13.0', require: false
gem 'cancancan', '~> 3.4.0'
gem 'cssbundling-rails', '~> 1.1.1'
gem 'devise', '~> 4.8.0'
gem 'draper', '~> 4.0.1'
gem 'factory_bot_rails', '~> 6.1'
gem 'ffaker', '~> 2.18'
gem 'haml', '~> 5.2.2'
gem 'haml-rails', '~> 2.0.1'
gem 'image_processing', '~> 1.8'
gem 'jsbundling-rails', '~> 1.0.3'
gem 'pagy', '~> 5.10.1'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'rails', '~> 7.0.4'
gem 'redis', '~> 4.0'
gem 'shrine', '~> 3.0'
gem 'simple_form', '~> 5.1.0'
gem 'sprockets-rails', '~> 3.4.2'

group :development, :test do
  gem 'apparition', '~> 0.6.0'
  gem 'pry-byebug', '~> 3.9'
  gem 'pry-rails', '~> 0.3.9'
  gem 'rspec-rails', '~> 5.1.0'
  gem 'rubocop-performance', '~> 1.13.2', require: false
  gem 'rubocop-rails', '~> 2.16.0', require: false
  gem 'rubocop-rspec', '~> 2.13.1', require: false
  gem 'simplecov', '~> 0.21.2', require: false
end

group :development do
  gem 'awesome_print', '~>1.9.2'
  gem 'better_errors', '~>2.9.1'
  gem 'binding_of_caller', '~> 1.0.0'
  gem 'brakeman', '~> 5.2.1'
  gem 'bundle-audit', '~> 0.1.0'
  gem 'database_consistency', '~> 1.1.12', require: false
  gem 'haml_lint', '~> 0.42.0', require: false
  gem 'i18n-debug', '~> 1.2.0', require: false
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'rails_best_practices', '~> 1.23.1'
  gem 'rails_db', '>= 2.3.1'
  gem 'solargraph', '~> 0.46.0'
  gem 'table_print', '~>1.5.7'
  gem 'web-console', '~> 4.2.0'
end

group :test do
  gem 'capybara', '>= 3.37'
  gem 'capybara-screenshot', '~> 1.0.26'
  gem 'cuprite', '~> 0.13'
  gem 'rack_session_access', '~> 0.2.0'
  gem 'rails-controller-testing', '~> 1.0.5'
  gem 'rspec_junit_formatter', '~> 0.5.1'
  gem 'selenium-webdriver', '~> 4.1.0'
  gem 'shoulda-matchers', '~> 5.1.0'
  gem 'site_prism', '~> 3.7.3'
  gem 'webdrivers', '~> 5.0.0'
end
