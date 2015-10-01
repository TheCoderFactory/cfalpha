class WelcomeMailerJob 
  include SuckerPunch::Job
  
  def perform(user_id)
  	ActiveRecord::Base.connection_pool.with_connection do
	  	User.find(user_id).add_role :club
	  	random_code = SecureRandom.hex(4)
	  	promo_code = PromoCode.create(user_id: user_id, name: 'Join the Club', percent_value: 10, expiry_date: Date.today + 60.days, code: random_code)
	  	WelcomeMailer.response(user_id, promo_code.id).deliver_now
	  end
    # raise NotImplementedError
  end
end
