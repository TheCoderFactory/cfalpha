class EnquiryReplyMailer < ApplicationMailer
	default from: "Coder Factory Enquiries <enquiries@coderfactory.com>"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.enquiry_reply_mailer.reply.subject
  #
  def reply(enquiry_id)
    @enquiry = Enquiry.find(enquiry_id)
		mail(to: @enquiry.email, subject: 'Your Coder Factory Enquiry')
  end
end
