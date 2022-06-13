# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SolrDocument, type: :model do
  subject { described_class }

  it { is_expected.to be <= Blacklight::Solr::Document }
  it { is_expected.to be <= BlacklightOaiProvider::SolrDocument }
  it { is_expected.to be_const_defined(:MODS_DOC_KEY) }
end
