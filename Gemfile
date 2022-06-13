# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.6'

gem 'blacklight', '~> 7.25'
gem 'blacklight_oai_provider', '~> 7.0'
gem 'bootsnap', '>= 1.4.4', require: false

gem 'puma', '~> 5.6', group: %i(development test staging)
gem 'rack-cors', '~> 1.1'
gem 'rails', '~> 6.1.6'
gem 'rsolr', '~> 2.5'

group :development, :test do
  gem 'awesome_print', '~> 1.9'
  gem 'dotenv-rails', '~> 2.7', require: 'dotenv/rails-now'
  gem 'pry', '~> 0.13.1'
  gem 'pry-rails'
  gem 'rspec-rails', '~> 5.1'
  gem 'rubocop', '~> 1.22', require: false
  gem 'rubocop-performance', '~> 1.12', require: false
  gem 'rubocop-rails', '~> 2.12', require: false
  gem 'rubocop-rspec', '~> 2.6', require: false
  gem 'solr_wrapper', '~> 3.1'
end

group :development do
  gem 'listen', '~> 3.3'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :test do
  gem 'climate_control', '~> 1.0'
  gem 'coveralls', require: false
  gem 'shoulda-matchers', '~> 5.1'
  gem 'vcr', '~> 6.1'
  gem 'webmock', '~> 3.14'
end

gem 'sd_notify', group: %i(staging)

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i(mingw mswin x64_mingw jruby)
