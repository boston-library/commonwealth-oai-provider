# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CuratorListSetsResponse, type: :model do
  subject { described_class }

  it { is_expected.to be <= BlacklightOaiProvider::Response::ListSets }

  it { is_expected.to be_const_defined(:DEFAULT_VERB) }
end
