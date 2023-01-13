require 'base64'
require 'fileutils'

module TextToImageDecoder

  def execute(text_file_path)
    convert_decoded_text_to_image(*read_data_from_file(text_file_path))
  end

  private
    def convert_decoded_text_to_image(file_type, encoded_text)
      path = 'root/tmp/' # This is made in ruby script so i am using root/tmp here in case of Rails. We can just use Rails.root.join('tmp', 'image.png')
      FileUtils.mkdir_p(path) unless File.directory?(path)
      
      File.open(path + 'straiv.' + file_type, 'wb').write(Base64.decode64(encoded_text))

      puts "Image is created with at path #{path}straiv.#{file_type}"
    end

    def retreive_file_type_from_string(string)
      string.split('/').last.split(';').first
    end

    def read_data_from_file(text_file_path)
      begin
        encoded_text  = File.open(text_file_path,'r').read()
        encoded_text = encoded_text.split(',')
        [retreive_file_type_from_string(encoded_text.first), encoded_text.last]
      rescue Errno::ENOENT
        puts 'File not found'
        return
      end
    end
end
