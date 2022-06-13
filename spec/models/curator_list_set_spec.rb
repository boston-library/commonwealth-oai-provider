# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CuratorListSet, type: :model do
  subject(:curatr_list_set_class) { described_class }

  it { is_expected.to be <= BlacklightOaiProvider::SolrSet }
  it { is_expected.to be_const_defined(:SOLR_FIELDS) }

  it 'expects :SOLR_FIELDS to be a hash and be frozen' do
    expect(curatr_list_set_class.const_get(:SOLR_FIELDS)).to be_a_kind_of(Hash).and be_frozen
  end
end
