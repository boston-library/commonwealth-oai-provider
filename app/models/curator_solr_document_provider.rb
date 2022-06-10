# frozen_string_literal: true

class CuratorSolrDocumentProvider < BlacklightOaiProvider::SolrDocumentProvider
  class << self
    def remove_format(prefix)
      return if @formats.nil?

      @formats.delete(prefix) if @formats.key?(prefix)
      nil
    end
  end
  register_format(OaiModsFormat.instance)

  remove_format('oai_dc')

  def list_sets(options = {})
    CuratorListSetsResponse.new(self, options).to_xml
  end
end
