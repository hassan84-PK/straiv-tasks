# frozen_string_literal: true

require 'open3'

input_file = 'Lorem_ipsum.pdf'
output_file = 'output.pdf'
# using ghost script command here, while keeoing in mind that machine have it installed already

command = 'gs -sDEVICE=pdfwrite -dPDFACompatibilityPolicy=1 -dPDFSETTINGS'\
          "=/printer -dNOPAUSE -dQUIET -dBATCH -sOutputFile=#{output_file} #{input_file}"

Open3.popen3(command) do |_stdin, _stdout, stderr, wait_thr|
  exit_status = wait_thr.value
  raise "Command #{command} failed with error: #{stderr.read}" unless exit_status.success?

  puts "#{input_file} is converted to #{output_file}"
end
