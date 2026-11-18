# frozen_string_literal: true

ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __dir__)

require 'bundler/setup' # Set up gems listed in the Gemfile.
require 'logger' # Solves concurrent ruby issue remove when we update this to rails > 7!!
require 'bootsnap/setup' # Speed up boot time by caching expensive operations.
