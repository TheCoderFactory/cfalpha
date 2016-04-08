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

validates :first_name, presence: true
validates :last_name, presence: true
validates :phone, presence: true # format: { with: /\d{3}-\d{3}-\d{4}/, message: "Follow the format: 123-123-1234" }

  require 'csv'

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

  #Export Users to csv
  def self.to_csv
    attributes = %w{Id Email Name Role}

    CSV.generate(headers: true) do |csv|
      csv << attributes
      all.each do |user|
        if user.roles.present?
          csv << [user.id, user.email, user.name, user.roles.map(&:name).join(', ')]
        else
          csv << [user.id, user.email, user.name]
        end
      end
    end
  end
end
