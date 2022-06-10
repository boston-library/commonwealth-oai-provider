# frozen_string_literal: true

module BlacklightOaiOverrides
  extend ActiveSupport::Concern

  included do
    include InstanceMethods

    before_action :sets_search_service, only: [:oai]
  end

  module InstanceMethods
    def oai
      body = oai_provider.process_request(oai_params.to_h)

      render xml: body, content_type: 'text/xml'
    end

    def oai_provider
      @oai_provider ||= CuratorSolrDocumentProvider.new(self, oai_config)
    end

    private

    def sets_search_service
      blacklight_config.search_builder_class = SetsSearchBuilder if oai_params[:verb] == 'ListSets'
    end
  end
end
