class WelcomeMailer < ApplicationMailer
	default from: "Coder Factory Welcome <info@coderfactory.com>"
  
  def response(user)
    @user = User.find(user)
    mail(to: @user.email, subject: @user.first_name + ", welcome to the Coder Factory Club")
  end
end
