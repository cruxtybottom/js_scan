require 'open-uri'
require 'digest/md5'
require 'json'

#Formats the URL file to put URLs in an array and then returns that array
def single
	file1 = File.open("/Users/ismeet/code/ruby/js_scan/clean_urls", "r")
	file_read = file1.read
	array1 = Array.new
	a = file_read.split(/"/)
	a.each do |url_bad|
			if url_bad ['http']
			array1 << url_bad
		end
	end
	return array1
end

#Function to get and hash
def hash (site)
	#hash_in_hash = Array.new
	#hash_in_hash = {"URL" => "MD5_Digest"}
	open (site) do |s|
		response = s.read
		digest = Digest::MD5.hexdigest(response)
		#string1 = site + " - " + digest + "\n"
		#file2 = File.open("/Users/ismeet/code/ruby/js_scan/hashes", "a")
		#file2.write(string1)
		return site, digest #Return site and digest. The hash has to be created in the outside function where we area calling the hash function.
	end
end

url_array = Array.new
url_array = single #Call the single method and assign urls to that array

hash_initial = {"URL" => "MD5_Digest"}

url_array.each do |site_in|
	s,d = hash(site_in)
	hash_initial[s] = d
end

File.open("./digests.json", "w") {|fo| fo.puts hash_initial.to_json }

#############################
=begin
puts "Please enter the URL for which you need a hash:"
puts "..............\n"
zztop = gets.chomp()
puts hash_initial[zztop]
=end