class EnquiryReplyMailerJob 
  include SuckerPunch::Job
  
  def perform(enquiry_id)
  	ActiveRecord::Base.connection_pool.with_connection do
  		EnquiryReplyMailer.reply(enquiry_id).deliver_now
  	end
    # raise NotImplementedError
  end
end
