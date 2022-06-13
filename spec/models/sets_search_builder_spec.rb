# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SetsSearchBuilder, type: :model do
  subject { described_class }

  it { is_expected.to be <= Blacklight::SearchBuilder }
  it { is_expected.to be <= Blacklight::Solr::SearchBuilderBehavior }

  it { is_expected.to respond_to(:default_processor_chain).with(0).argument }
end
