class CourseIntake < ActiveRecord::Base
  belongs_to :course
  belongs_to :course_location
  has_many :course_bookings, dependent: :destroy
  has_many :promo_codes

  # extend FriendlyId
  # friendly_id :name, use: :slugged

  def self.chron_order
  	order(start_date: :asc)
  end

  def self.upcoming
  	chron_order.where('start_date >= ?', Date.today)
  end

  def self.past
  	chron_order.where('start_date < ?', Date.today)
  end

  def bookings_revenue
  	course_bookings.sum(:price)
  end



end
