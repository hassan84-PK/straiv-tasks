require './modules/xml_file_reader'
require './modules/xml_to_hash'
require 'ostruct'

include XmlFileReader
include XmlToHash

document =  read('data/xml_compressed.xml')
data_struct = OpenStruct.new(convert_to_hash(document))
puts data_struct
