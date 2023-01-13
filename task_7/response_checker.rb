# frozen_string_literal: true

require 'net/http'

# https://httpstat.us/status_code will return response mentioned in request
# So used it here for testing and development
# in case there a case and i have to handle it for a url then url will be passed in request_server
# method and random_url will be removed

# added this to generate random url
def random_url
  status_codes = [200, 500].sample
  URI("https://httpstat.us/#{status_codes}")
end

def request_server
  success_code = nil
  10.times do
    response = Net::HTTP.get_response(random_url)
    if response.is_a?(Net::HTTPSuccess)
      success_code = response.code
      break
    else
      puts "Request failed with status code: #{response.code}"
    end
  end
  success_code || "All requests failed with status code: #{response.code}"
end

response = request_server
puts response
