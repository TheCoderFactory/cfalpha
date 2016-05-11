class CourseBooking < ActiveRecord::Base
  belongs_to :course_intake
  belongs_to :user
  has_many :payments
  has_paper_trail

  scope :has_paid,               -> { where(paid: true) }
  scope :not_paid,               -> { where(paid: nil) }

  def self.this_week
    most_recent.where('created_at > ?', Date.today - 7.days)
  end

  def self.last_week
    most_recent.where('created_at > ? and created_at < ?', Date.today - 14.days, Date.today - 7.days)
  end

  def self.have_paid
    where(paid: true)
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

  def apply_promo_code(promo_code_id)
    @promo_code = PromoCode.find(promo_code_id)
    self.discount = ((@promo_code.percent_value / 100.0) * self.price)
    self.price = self.price - self.discount
    update_attributes(promo_code: @promo_code.id, discount: discount, price: price)
  end
  # def apply_promo_code
  #   if self.promo_code.price_value
  #     self.discount = @promo_code.price_value
  #   elsif self.promo_code.percent_value > 0
  #     self.discount = ((self.promo_code.percent_value / 100.0) * self.price)
  #   end
  #   self.price = self.price - self.discount
  #   self.promo_code.redeemed(self.course_intake_id, self.user_id, self.discount)
  # end

  def calculate_gst
    self.gst = (self.price) * 0.1
  end

  def mark_as_paid
    self.update_attributes(paid: true)
  end

end
