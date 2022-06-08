# frozen_string_literal: true

class SetsSearchBuilder < Blacklight::SearchBuilder
  include Blacklight::Solr::SearchBuilderBehavior

  self.default_processor_chain += [
    :harvestable_filter, :collections_filter
  ]

  def harvestable_filter(solr_parameters = {})
    solr_parameters[:fq] ||= []
    solr_parameters[:fq] << '+harvesting_status_bsi:true'
  end

  def collections_filter(solr_parameters = {})
    solr_parameters[:fq] ||= []
    solr_parameters[:fq] << '+curator_model_suffix_ssi:"Collection"'
  end
end
