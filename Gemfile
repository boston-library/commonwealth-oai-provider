# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '~> 3.2.5'

gem 'blacklight', '~> 7.32.0', '< 8'
gem 'blacklight_oai_provider', '~> 7.0.2'
gem 'bootsnap', '>= 1.4.4', require: false
gem 'nokogiri', '>= 1.16.2'
gem 'puma', '~> 6.4'
gem 'rack-cors', '~> 1.1'
gem 'rails', '~> 7.0.8' # NOTE can't update to rails 7.1 with current version of blacklight
gem 'redis', '~> 5'
gem 'rsolr', '~> 2.5'
gem 'sprockets-rails'

group :development, :test do
  gem 'capistrano', '~> 3.17', require: false
  gem 'capistrano-rails', '~> 1.4', require: false
  gem 'capistrano-rvm'
  gem 'debug', platforms: %i(mri windows)
  gem 'dotenv-rails', '~> 2.8', require: 'dotenv/rails-now'
  gem 'rspec-rails', '~> 6.1'
  gem 'rubocop', '~> 1.36', require: false
  gem 'rubocop-performance', '~> 1.15', require: false
  gem 'rubocop-rails', '~> 2.16', require: false
  gem 'rubocop-rspec', require: false
  gem 'solr_wrapper', '~> 4'
end

group :development do
  gem 'listen', '~> 3.3'
end

group :test do
  gem 'climate_control', '~> 1.0'
  gem 'coveralls_reborn', require: false
  gem 'shoulda-matchers', '~> 5.2'
  gem 'vcr', '~> 6.1'
  gem 'webmock', '~> 3.18'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i(mingw mswin x64_mingw jruby)
