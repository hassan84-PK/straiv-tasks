require 'net/http'

#https://httpstat.us/status_code will return response mentioned in request
# So used it here for testing and development
# in case there a case and i have to handle it for a url then url will be passed in request_server
# method and random_url will be removed

def random_url #added this to generate random url
  URI("https://httpstat.us/#{[200, 500][rand(2)]}") 
end

def request_server(count = 10)
  response = Net::HTTP.get_response(random_url)
  if response.is_a?(Net::HTTPInternalServerError)
    count -= 1
    puts "response code: #{response.code}"
    puts "Request failed with status code: #{response.code}" if count.zero?
    return request_server(count) unless count.zero?
  else
    return response.code
  end
end

response = request_server
puts response