# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CuratorSolrDocumentProvider, type: :model do
  subject { described_class }

  it { is_expected.to be <= BlacklightOaiProvider::SolrDocumentProvider }

  it { is_expected.to respond_to(:remove_format).with(1).argument }
end
