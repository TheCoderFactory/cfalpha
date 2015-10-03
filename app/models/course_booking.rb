class CourseBooking < ActiveRecord::Base
  belongs_to :course_intake
  belongs_to :user

  def self.this_week
  	most_recent.where('created_at > ?', Date.today - 7.days)
  end

  def self.last_week
    most_recent.where('created_at > ? and created_at < ?', Date.today - 14.days, Date.today - 7.days)
  end

  def self.last_month
    most_recent.where('created_at > ? and created_at < ?', Date.today - 60.days, Date.today - 30.days)
  end

  def self.most_recent
    order(created_at: :desc)
  end

  before_create :set_guid, :check_promo_code, :calculate_gst

  def set_guid
  	self.guid = SecureRandom.uuid
  end

  def check_promo_code
  	if self.promo_code
  		if @promo_code = PromoCode.find_by(code: self.promo_code)
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
  end

  def calculate_gst
    if self.discount
  	 self.gst = (self.price - self.discount) * 0.1
    else
      self.gst = self.price * 0.1
    end
  end

  def mark_as_paid
    self.update_attributes(paid: true)
  end

end
