# frozen_string_literal: true

require 'base64'
require 'fileutils'

module TextToImageDecoder
  def execute(text_file_path)
    file_type, encoded_text = read_data_from_file(text_file_path)
    return unless file_type && encoded_text

    convert_decoded_text_to_image(file_type, encoded_text)
  end

  private

  def convert_decoded_text_to_image(file_type, encoded_text)
    # This is made in ruby script so here i am using root/tmp.
    # But in case of Rails we can just use Rails.root.join('tmp', 'straiv')
    path = 'root/tmp/'
    FileUtils.mkdir_p(path) unless File.directory?(path)

    File.write("#{path}straiv.#{file_type}", Base64.decode64(encoded_text))

    puts "Image is created at path #{path}straiv.#{file_type}"
  end

  def read_data_from_file(text_file_path)
    encoded_text = File.read(text_file_path)
    file_type = encoded_text[%r{/(.+);}, 1]
    encoded_text = encoded_text.split(',')[1]
    [file_type, encoded_text]
  rescue Errno::ENOENT
    puts 'File not found'
    [nil, nil]
  end
end
