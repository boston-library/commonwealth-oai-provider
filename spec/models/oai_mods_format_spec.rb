# frozen_string_literal: true

require 'rails_helper'

RSpec.describe OaiModsFormat, type: :model do
  subject(:oai_mods_format_class) { described_class }

  it { is_expected.to be <= OAI::Provider::Metadata::Format }
  it { is_expected.to be_const_defined(:OAI_MODS_FORMAT_ATTRS) }
  it { is_expected.to be_const_defined(:OAI_MODS_FORMAT_HEADER_SPECS) }
  it { is_expected.to respond_to(:instance).with(0).arguments }

  it 'expects :OAI_MODS_FORMAT_ATTRS to be a Hash and be frozen' do
    expect(oai_mods_format_class.const_get(:OAI_MODS_FORMAT_ATTRS)).to be_a_kind_of(Hash).and be_frozen
  end

  it 'expects :OAI_MODS_FORMAT_HEADER_SPECS to be a hash and be frozen' do
    expect(oai_mods_format_class.const_get(:OAI_MODS_FORMAT_HEADER_SPECS)).to be_a_kind_of(Hash).and be_frozen
  end

  describe 'instance' do
    subject(:oai_mods_format) { described_class.instance }

    let!(:expected_attributes) { described_class.const_get(:OAI_MODS_FORMAT_ATTRS) }
    let!(:expected_header_attrs) { described_class.const_get(:OAI_MODS_FORMAT_HEADER_SPECS) }

    it 'expects instance variables to match key values in :OAI_MODS_FORMAT_ATTRS' do
      expected_attributes.each do |attr_name, attr_val|
        expect(oai_mods_format).to be_instance_variable_defined("@#{attr_name}")
        expect(oai_mods_format.instance_variable_get("@#{attr_name}")).to eql(attr_val)
      end
    end

    it 'expects #header_specification to equal OAI_MODS_FORMAT_HEADER_SPECS' do
      expect(oai_mods_format.header_specification).to equal(expected_header_attrs)
    end
  end
end
