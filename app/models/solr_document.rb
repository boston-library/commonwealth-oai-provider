# frozen_string_literal: true

class SolrDocument
  include Blacklight::Solr::Document
  include BlacklightOaiProvider::SolrDocument

  MODS_DOC_KEY = 'mods_xml_ss'

  SolrDocument.extension_parameters[:mods_source_field] = MODS_DOC_KEY

  self.timestamp_key = 'system_create_dtsi'
  # self.unique_key = 'id'

  use_extension(Blacklight::Document::Mods)

  def to_mods
    export_as_oai_mods_xml
  end

  def sets
    CuratorListSet.sets_for(self)
  end
end
