# frozen_string_literal: true

namespace :commonwealth_oai_provider do
  namespace :test_index do
    desc 'Seed sample solr data in solr'
    task seed: :environment do
      require 'yaml'

      if %w(staging production).member?(Rails.env)
        puts "Environment is set to #{Rails.env}. Skipping"
      else
        docs = YAML.safe_load(File.open(File.join(File.join(Rails.root,
                                                            'spec',
                                                            'fixtures',
                                                            'solr_sample_docs.yml'))), [Symbol])
        conn = Blacklight.default_index.connection

        conn.add docs
        conn.commit
      end
    end
  end
end
