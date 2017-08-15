require 'igdb_api'
require 'ostruct'
require './lib/monkey_patches/igdb_requester'
require 'json'
require 'timeout'

Igdb.set_api_url("https://api-2445582011268.apicast.io")
begin
  timeout = Timeout::timeout(5) do
    Igdb.connect(ENV['IGDB_USER_KEY'])
  end
  IGDB_CONNECTION = Igdb
rescue Timeout::Error
  IGDB_CONNECTION = nil
  puts "Connection to IGDB FAILED"
  p "Timeout, request took longer than 5 seconds"
  p e.inspect
rescue => e
  IGDB_CONNECTION = nil
  puts "Connection to IGDB FAILED"
  p e.inspect
  p e.backtrace.join("\n")
end


