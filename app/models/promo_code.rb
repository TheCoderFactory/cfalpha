class PromoCode < ActiveRecord::Base
  belongs_to :user
  belongs_to :course_intake

  validates :name, :code, presence: true
  validates :price_value, presence: true, if: :percent_value_blank?
  validates :percent_value, presence: true, if: :price_value_blank?
  validate :expiry_date_cannot_be_in_the_past
  validates :code, uniqueness: true
 
  has_paper_trail
  
  def expiry_date_cannot_be_in_the_past
    if expiry_date.present? && expiry_date <= Date.today + 1.day
      errors.add(:expiration_date, "must be in the future")
    end
  end

  def percent_value_blank?
  	percent_value == nil
  end

  def price_value_blank?
  	price_value == nil
  end

  def redeemed(course_intake_id, user_id, discount_value)
    self.update_attributes(date_used: Date.today, course_intake_id: course_intake_id, user_id: user_id, discount: discount_value)
  end

end
