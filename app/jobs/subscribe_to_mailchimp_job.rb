class SubscribeToMailchimpJob 
  include SuckerPunch::Job
  
  def perform(enquiry_id)
  	enquiry = Enquiry.find(enquiry_id)
  	uri = URI.parse('https://zapier.com/hooks/catch/3hn17j/')
  	uri.query = URI.encode_www_form(
  	  'email'       => enquiry.email,
  	  'first_name'  => enquiry.first_name,
  	  'last_name'   => enquiry.last_name,
  	  'company'     => enquiry.company,
  	  'group'       => enquiry.enquiry_type.name.titleize.remove(' ').underscore.upcase.constantize
  	)
  	uri.to_s
  	open(uri)
    if enquiry.enquiry_type.important
      PushToHubspotJob.new.async.perform(self.id)
    end
  end
end


