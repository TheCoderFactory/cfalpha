class WelcomeMailer < ApplicationMailer
	default from: "Coder Factory Welcome <info@coderfactory.com>"
  
  def response(user, promo_code_id)
    @user = User.find(user)
    @promo_code = PromoCode.find(promo_code_id)
    mail(to: @user.email, subject: @user.first_name + ", welcome to the Coder Factory Club")
  end
end
