class EnquiryMailer < ActionMailer::Base
  default from: "Coder Factory Enquiries <info@coderfactory.com>"

  def response(enquiry_id)
    @enquiry = Enquiry.find(enquiry_id)
    mail(to: @enquiry.email, subject: @enquiry.first_name + ", your Coder Factory enquiry has been received")
  end

  def received(enquiry_id)
    @enquiry = Enquiry.find(enquiry_id)
    mail(to: "pete@coderfactory.com", subject: "Coder Factory Enquiry Received")
  end
end
