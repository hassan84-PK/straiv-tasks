require 'nokogiri'

module XmlFileReader
  def read(file_path)
    nokogiri_xml_reader(file_path)
  end

  private

    def nokogiri_xml_reader(file_path)
      document = Nokogiri.XML(File.open(file_path))
      document.remove_namespaces!
    end
end
