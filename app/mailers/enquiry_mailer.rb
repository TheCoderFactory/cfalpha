class EnquiryMailer < ActionMailer::Base
  default from: "Coder Factory Enquiries <info@coderfactory.com>"

  def response(enquiry)
    @enquiry = enquiry
    mail(to: @enquiry.email, subject: @enquiry.first_name + ", your Coder Factory enquiry has been received")
  end

  def received(enquiry)
    @enquiry = enquiry
    mail(to: "info@coderfactory.com", subject: "Coder Factory Enquiry Received")
  end
end
