require 'open-uri'

puts "Please enter the site you want to scan:\n" #Todo - Input Validation
site = gets.chomp()

#Function to capture request
def get_request(in_site)
	open (in_site) do |page|
		page_response = page.read	
		return page_response
	end
end


#Function to store get response to File
def out_file(in_response, file_name)
	target = File.open(file_name, "w")
	target.write(in_response)
end






response = get_request(site) #Get request to call the page
out_file(response, "/Users/ismeet/code/rails/google") #Write out to google file
