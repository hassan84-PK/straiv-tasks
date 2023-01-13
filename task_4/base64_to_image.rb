# frozen_string_literal: true

require './modules/text_to_image_decoder'
include TextToImageDecoder

text_file_path = 'base64.txt'
execute(text_file_path)
