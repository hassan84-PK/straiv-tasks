# frozen_string_literal: true

require 'nokogiri'

module XmlFileReader
  def self.read(file_path)
    Nokogiri.XML(File.open(file_path)).remove_namespaces!
  end
end
