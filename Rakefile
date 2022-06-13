# frozen_string_literal: true

# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

Rails.application.load_tasks

if %w(development test).member?(ENV.fetch('RAILS_ENV', 'development'))
  require 'rubocop/rake_task'
  RuboCop::RakeTask.new(:rubocop) do |task|
    task.fail_on_error = true
  end

  require 'solr_wrapper/rake_task'

  task default: :ci

  desc 'Lint, set up test app, spin up Solr, and run specs'
  task ci: [:rubocop] do
    puts 'running continuous integration'
    SolrWrapper.wrap do |solr|
      solr.with_collection do
        system 'RAILS_ENV=test rake commonwealth_oai_provider:test_index:seed'
        Rake::Task['spec'].invoke
      end
    end
  end
end
