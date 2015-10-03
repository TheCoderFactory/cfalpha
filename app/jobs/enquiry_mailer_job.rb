class EnquiryMailerJob 
  include SuckerPunch::Job
  
  def perform(enquiry_id)
  	ActiveRecord::Base.connection_pool.with_connection do
  		EnquiryMailer.response(enquiry_id).deliver_now
  		EnquiryMailer.received(enquiry_id).deliver_now
  		@enquiry = Enquiry.find(enquiry_id)
  		if @enquiry.enquiry_type.important
  			@enquiry.create_send_zapier_link
  		end
  	end
    # raise NotImplementedError
  end
end
