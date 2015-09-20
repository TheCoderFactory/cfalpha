class CourseBooking < ActiveRecord::Base
  belongs_to :course_intake
  belongs_to :user

  def self.last_seven_days
  	where('created_at > ?', Date.today - 7.days)
  end

  before_create :set_guid, :check_promo_code, :calculate_gst

  def set_guid
  	self.guid = SecureRandom.uuid
  end

  def check_promo_code
  	if self.promo_code
  		@promo_code = PromoCode.find_by(code: self.promo_code)
  		unless @promo_code.date_used
  			if @promo_code.price_value
  				self.discount = @promo_code.price_value
  			elsif @promo_code.percent_value > 0
  				self.discount = ((@promo_code.percent_value / 100.0) * self.price)
  			end
  			self.price = self.price - self.discount
        @promo_code.redeemed(self.course_intake_id, self.user_id, self.discount)
  		end
  	end
  end

  def calculate_gst
    if self.discount
  	 self.gst = (self.price - self.discount) * 0.1
    else
      self.gst = self.price * 0.1
    end
  end

end
