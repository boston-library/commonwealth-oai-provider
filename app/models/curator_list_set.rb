# frozen_string_literal: true

class CuratorListSet < BlacklightOaiProvider::SolrSet
  SOLR_FIELDS = {
    spec: 'id',
    name: 'title_info_primary_tsi',
    description: 'abstract_tsi'
  }.freeze

  class << self
    def all
      builder = search_service.search_builder.merge({ rows: 10000 })
      response = search_service.repository.search(builder)

      sets_from_fields(response.documents) if response.documents
    end

    def sets_from_fields(document_results)
      sets = document_results.map do |doc|
        new("#{SOLR_FIELDS[:spec]}:#{doc[SOLR_FIELDS[:spec]]}", name: doc[SOLR_FIELDS[:name]], description: doc[SOLR_FIELDS[:description]])
      end
      sets.empty? ? nil : sets
    end

    def from_spec(spec)
      return super if spec.include?('oai_ark_id')

      spec = "oai_ark_id:#{spec}"
      super
    end
  end

  attr_accessor :name

  def initialize(spec, name: nil, description: nil)
    @label, @value = spec.split(':', 2)
    raise OAI::ArgumentException if [@label, @value].any?(&:blank?)

    config = self.class.field_config_for(@label)
    if config.present?
      @solr_field = config[:solr_field]
      @description = config[:description]
    elsif SOLR_FIELDS.value?(label)
      @solr_field = @label
      @name = name
      @description = description
    end
    raise OAI::ArgumentException if @solr_field.blank?
  end

  def spec
    @value
  end
end
