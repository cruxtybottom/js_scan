require 'open-uri'


#Search for lines with non time and has a .js in the URL

url_array = Array.new	
open ("./google") do |f|
	f.each_line do |line|
		if line ['.js'] and line ['http'] and not line ['time']
			url_array << line
		end
	end
end

#Function strips using *split* everything bu the exact URL
def get_js_url (arr_in)
	clean_url_array = Array.new
	arr_in.each do |ss|
		a = ss.split(/"/)
		a.each do |line|
			clean_url_array << line if line ['http']
		end
	end
	return clean_url_array
end

x = get_js_url (url_array)
b =x.to_s

#Write clean URLs to a File
target = File.open("./clean_urls", "w")
target.write(b)