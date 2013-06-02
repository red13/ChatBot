require 'webrick'
include WEBrick

dir = Dir::pwd
host = "192.168.1.42"
port = 18000
puts "URL: http://#{host}:#{port}"

s = HTTPServer.new(
  :Port => port,
  :DocumentRoot => dir )

trap("INT"){ s.shutdown }
s.start
