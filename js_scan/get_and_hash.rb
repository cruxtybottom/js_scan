require 'open-uri'
require 'digest/md5'

#Formats the URL file to put URLs in an array and then returns that array
def single
	file1 = File.open("/Users/ismeet/code/rails/js_scan/clean_urls", "r")
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
	open (site) do |s|
		response = s.read
		digest = Digest::MD5.hexdigest(response)
		string1 = site + " - " + digest + "\n"
		file2 = File.open("/Users/ismeet/code/rails/js_scan/hashes", "a")
		file2.write(string1)
	end
end

url_array = Array.new
url_array = single #Call the single method and assign urls to that array

url_array.each do |site_in|
	hash(site_in)
end

