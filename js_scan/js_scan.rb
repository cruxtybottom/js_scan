require 'open-uri'
require 'net/http'

#Get the URL you want to scan
#prompt = "> "
#puts "Enter the URL you want to scan:"
#prompt; URL = gets.chomp()

#puts "#{URL}"

#Perform a get request

#open("http://www.google.com/") {|f|
#  f.each_line {|line| p line}}

uri = URI('http://www.time.com')

Net::HTTP.start(uri.host, uri.port) do |http|
  request = Net::HTTP::Get.new uri

  response = http.request request # Net::HTTPResponse object
  puts response

  body = response.body
  puts body
end

