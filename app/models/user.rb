class User < ActiveRecord::Base
	has_many :course_bookings
	has_many :enquiries
	has_one :profile
	has_many :promo_codes
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def name
  	[first_name, last_name].compact.join(' ')
  end
end
