require 'timeout'
require "net/http"
require "uri"

uri = URI.parse("https://api-2445582011268.apicast.io/games/")

http = Net::HTTP.new(uri.host, uri.port) 
http.use_ssl = true
request = Net::HTTP::Get.new(uri.request_uri) 
request['user-key'] = "key"
request['Accept'] = "application/json"


response = nil
begin
  timeout = Timeout::timeout(5) do
    response = http.request(request)
  end
rescue Timeout::Error
  p "Timeout, request took longer than 5 seconds"
rescue => e
  p e.inspect
  p e.backtrace.join("\n")
end

p response.code
p response.body



