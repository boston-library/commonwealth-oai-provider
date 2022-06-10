# frozen_string_literal: true

class OaiModsFormat < OAI::Provider::Metadata::Format
  OAI_MODS_FORMAT_ATTRS = {
    prefix: 'oai_mods',
    schema: 'http://www.openarchives.org/OAI/2.0',
    namespace: 'http://www.openarchives.org/OAI/2.0',
    element_namespace: 'mods',
    fields: []
  }.freeze

  OAI_MODS_FORMAT_HEADER_SPECS = {
    'xmlns' => 'http://www.openarchives.org/OAI/2.0/',
    'xmlns:xsi' => 'http://www.w3.org/2001/XMLSchema-instance',
    'xsi:schemaLocation' =>
      %{http://www.openarchives.org/OAI/2.0/
        http://www.openarchives.org/OAI/2.0/OAI-PMH.xsd}.gsub(/\s+/, ' ')
  }.freeze

  def initialize
    OAI_MODS_FORMAT_ATTRS.each { |name, value| instance_variable_set("@#{name}", value.dup) }
  end

  def header_specification
    OAI_MODS_FORMAT_HEADER_SPECS
  end
end
