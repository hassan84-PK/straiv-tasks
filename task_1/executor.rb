# frozen_string_literal: true

require './modules/xml_file_reader'
require './modules/xml_to_hash'
require 'ostruct'

include XmlFileReader
include XmlToHash

document =  XmlFileReader.read('data/xml_compressed.xml')
data_struct = OpenStruct.new(XmlToHash.convert_to_hash(document))
puts data_struct
