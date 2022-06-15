# frozen_string_literal: true

module XmlResponse
  def xml_response(response_body)
    Nokogiri::XML(response_body)
  end

  def xml_at_xpath(xml, xpath)
    xml.at_xpath(xpath) if xml.respond_to?(:at_xpath)
  end
end


RSpec.configure do |config|
  config.include XmlResponse, type: :request
end
