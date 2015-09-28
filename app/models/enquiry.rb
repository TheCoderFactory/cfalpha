class Enquiry < ActiveRecord::Base
  belongs_to :enquiry_type
  belongs_to :user

  validates :enquiry_type_id, :email, :first_name, :message, presence: true

  def full_name
  	[first_name, last_name].compact.join(" ")
  end

  def self.last_seven_days
  	where('created_at > ?', Date.today - 7.days)
  end
end
