# frozen_string_literal: true

class SearchBuilder < Blacklight::SearchBuilder
  include Blacklight::Solr::SearchBuilderBehavior

  self.default_processor_chain += %i(harvestable_filter digital_objects_filter)

  def harvestable_filter(solr_parameters = {})
    solr_parameters[:fq] ||= []
    solr_parameters[:fq] << '+harvesting_status_bsi:true'
  end

  def digital_objects_filter(solr_parameters = {})
    solr_parameters[:fq] ||= []
    solr_parameters[:fq] << '+curator_model_suffix_ssi:DigitalObject'
  end
end
