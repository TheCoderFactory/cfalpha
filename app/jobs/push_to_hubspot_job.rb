class PushToHubspotJob 
  include SuckerPunch::Job
  
  def perform(enquiry_id)
  	enquiry = Enquiry.find(enquiry_id)
    uri = URI.parse('https://zapier.com/hooks/catch/3hn17j/')
  	uri.query = URI.encode_www_form(
  	  'email' 			=> enquiry.email,
  	  'first_name' 	=> enquiry.first_name,
  	  'last_name' 	=> enquiry.last_name,
  	  'phone'				=> enquiry.phone,
  	  'company'			=> enquiry.company,
  	  'message'			=> enquiry.enquiry_type.name + ': ' + enquiry.message
  	)
  	uri.to_s
  	open(uri)
  end
end
