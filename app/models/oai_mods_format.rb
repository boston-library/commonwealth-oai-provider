# frozen_string_literal: true

class OaiModsFormat < OAI::Provider::Metadata::Format
  def initialize
    @prefix = 'mods'
    @schema = 'http://www.openarchives.org/OAI/2.0'
    @namespace = 'http://www.openarchives.org/OAI/2.0'
    @element_namespace = 'mods'
    @fields = []
  end

  def header_specification
    {
      'xmlns' => 'http://www.openarchives.org/OAI/2.0/',
      'xmlns:mods' => 'http://www.loc.gov/mods/v3',
      'xmlns:xsi' => 'http://www.w3.org/2001/XMLSchema-instance',
      'xsi:schemaLocation' =>
        %{http://www.openarchives.org/OAI/2.0/
          http://www.openarchives.org/OAI/2.0/OAI-PMH.xsd}.gsub(/\s+/, ' ')
    }
  end
end
