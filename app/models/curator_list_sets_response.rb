# frozen_string_literal: true

class CuratorListSetsResponse < BlacklightOaiProvider::Response::ListSets
  DEFAULT_VERB = 'ListSets'

  def to_xml
    raise OAI::SetException unless provider.model.sets

    response do |r|
      r.ListSets do
        provider.model.sets.each do |set|
          r.set do
            r.setSpec set.spec
            r.setName set.name
            r.setDescription(set.description) if set.respond_to?(:description) && set.description.present?
          end
        end
      end
    end
  end

  def verb
    DEFAULT_VERB
  end
end
