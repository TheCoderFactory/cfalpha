class EnquiryMailer < ActionMailer::Base
  default from: "Coder Factory Enquiries <info@coderfactory.com>"

  def response(enquiry)
    @enquiry = Enquiry.find(enquiry)
    mail(to: @enquiry.email, subject: @enquiry.first_name + ", your Coder Factory enquiry has been received")
  end

  def received(enquiry)
    @enquiry = Enquiry.find(enquiry)
    mail(to: "pete@coderfactory.com", subject: "Coder Factory Enquiry Received")
  end
end
