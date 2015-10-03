class User < ActiveRecord::Base
	has_many :course_bookings, dependent: :restrict_with_exception
	has_many :enquiries, dependent: :restrict_with_exception
	has_one :profile, dependent: :destroy
	has_many :promo_codes, dependent: :restrict_with_exception
  has_many :posts, dependent: :restrict_with_exception
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :check_for_enquiries, :create_promo_code

  def check_for_enquiries
    @enquiries = Enquiry.where(email: self.email)
    @enquiries.each do |enquiry|
      enquiry.update_attributes(user_id: self.id)
    end
  end

  def name
  	[first_name, last_name].compact.join(' ')
  end

  def self.alphabetical
    order(first_name: :asc)
  end

  def create_promo_code
    WelcomeMailerJob.new.async.perform(self.id)
  end

end
