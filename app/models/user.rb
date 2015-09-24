class User < ActiveRecord::Base
	has_many :course_bookings
	has_many :enquiries
	has_one :profile
	has_many :promo_codes
  has_many :posts
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :check_for_enquiries

  def check_for_enquiries
    @enquiries = Enquiry.where(email: self.email)
    @enquiries.each do |enquiry|
      enquiry.update_attributes(user_id: self.id)
    end
  end

  def name
  	[first_name, last_name].compact.join(' ')
  end
end
