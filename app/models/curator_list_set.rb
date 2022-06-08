# frozen_string_literal: true

class CuratorListSet < BlacklightOaiProvider::SolrSet
  def spec
    @value
  end
end
