require 'base64'

module TextToImageDecoder

  def execute(text_file_path)
    decoded_text = read_data_from_file(text_file_path)
    convert_decoded_text_to_image(decoded_text)
  end

  private
    def convert_decoded_text_to_image(decoded_text)
      image_path = 'root/tmp/image.png'
      # This is made in ruby script so i am using root/tmp here in case of Rails
      # We can just use Rails.root.join('tmp', 'image.png')
      File.open(image_path, 'wb') do |f|
        f.write decoded_text
      end
      puts "Image is created with at path #{image_path}"
    end

    def read_data_from_file(text_file_path)
      begin
        file = File.open(text_file_path,'r')
        decoded_text = Base64.decode64(file.read.gsub!('data:image/png;base64,',''))
        file.close
      rescue Errno::ENOENT
        puts 'File not found'
        return
      end
    end
end
