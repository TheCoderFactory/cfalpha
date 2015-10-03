class Enquiry < ActiveRecord::Base
  belongs_to :enquiry_type
  belongs_to :user

  require 'uri'

  validates :enquiry_type_id, :email, :first_name, :message, presence: true

  def full_name
  	[first_name, last_name].compact.join(" ")
  end

  def self.last_seven_days
  	where('created_at > ?', Date.today - 7.days)
  end

  def create_and_send_zapier_link
  	uri = URI.parse('https://zapier.com/hooks/catch/3hn17j/')
  	uri.query = URI.encode_www_form(
  	  'email' 			=> self.email,
  	  'first_name' 	=> self.first_name,
  	  'last_name' 	=> self.last_name,
  	  'phone'				=> self.phone,
  	  'company'			=> self.company,
  	  'message'			=> self.enquiry_type.name + ': ' + self.message
  	)
  	uri.to_s
  	open(uri)
  end
end
