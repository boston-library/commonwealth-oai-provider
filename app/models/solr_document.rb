# frozen_string_literal: true

class SolrDocument
  include Blacklight::Solr::Document
  include BlacklightOaiProvider::SolrDocument

  SolrDocument.extension_parameters[:mods_source_field] = 'mods_xml_ss'

  self.timestamp_key = 'system_create_dtsi'
  # self.unique_key = 'id'

  # DublinCore uses the semantic field mappings below to assemble an OAI-compliant Dublin Core document
  # Semantic mappings of solr stored fields. Fields may be multi or
  # single valued. See Blacklight::Document::SemanticFields#field_semantics
  # and Blacklight::Document::SemanticFields#to_semantic_values
  # Recommendation: Use field names from Dublin Core
  use_extension(Blacklight::Document::DublinCore)
  use_extension(Blacklight::Document::Mods)

  def to_mods
    export_as_oai_mods_xml
  end

  def sets
    CuratorListSet.sets_for(self)
  end
end
