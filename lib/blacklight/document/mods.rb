# frozen_string_literal: true

require 'nokogiri'

module Blacklight::Document::Mods
  def self.extended(document)
    Blacklight::Document::Mods.register_export_formats(document)
  end

  def self.register_export_formats(document)
    document.will_export_as(:xml)
    document.will_export_as(:mods_xml, 'text/xml')
    document.will_export_as(:oai_mods_xml, 'text/xml')
  end

  def export_as_oai_mods_xml
    load_mods
  end

  alias_method :export_as_xml, :export_as_oai_mods_xml
  alias_method :export_as_mods_xml, :export_as_oai_mods_xml

  private

  def load_mods
    Zlib::Inflate.inflate(Base64.decode64(fetch(mods_source_field))).gsub('<?xml version="1.0" encoding="UTF-8"?>', '')
  end

  def mods_source_field
    self.class.extension_parameters[:mods_source_field]
  end
end
