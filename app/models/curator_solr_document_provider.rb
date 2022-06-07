# frozen_string_literal: true

class CuratorSolrDocumentProvider < BlacklightOaiProvider::SolrDocumentProvider
  register_format(OaiModsFormat.instance)
end
