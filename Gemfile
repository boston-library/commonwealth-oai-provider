# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.3.9'

gem 'base64' # NOTE: Needed here to resolve deprecation about not being a default gem in 3.4
gem 'bigdecimal' # NOTE: Needed here to resolve deprecation about not being a default gem in 3.4
gem 'blacklight', '~> 7.32.0', '< 8'
gem 'blacklight_oai_provider', '~> 7.0.2'
gem 'bootsnap', '>= 1.4.4', require: false
gem 'concurrent-ruby', '1.3.4' # NOTE need to lock it to this version for now due to a bug introduced in 1.3.5
gem 'drb' # NOTE: Needed here to resolve deprecation about not being a default gem in 3.4
gem 'mutex_m' # NOTE:  Needed here to resolve deprecation about not being a default gem in 3.4 
gem 'nokogiri', '>= 1.18.9'
gem 'puma', '~> 6.6'
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
  gem 'solr_wrapper', '~> 4.1'
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
gem 'tzinfo-data', platforms: %i(windows jruby)
