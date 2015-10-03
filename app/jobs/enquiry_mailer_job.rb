class EnquiryMailerJob 
  include SuckerPunch::Job
  
  def perform(enquiry_id)
  	ActiveRecord::Base.connection_pool.with_connection do
  		EnquiryMailer.response(enquiry_id).deliver_now
  		EnquiryMailer.received(enquiry_id).deliver_now
  		SubscribeToMailchimpJob.new.async.perform(enquiry_id)
  	end
    # raise NotImplementedError
  end
end
