class Enquiry < ActiveRecord::Base
  belongs_to :enquiry_type
  belongs_to :user

  validates :enquiry_type_id, :email, :first_name, :message, presence: true

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

  def self.pending
    where('reply_sent = ?', nil)
  end

  def self.responded
    where('reply_sent <= ?', DateTime.now)
  end

  def send_emails
  	EnquiryMailerJob.new.async.perform(self.id)
  end

  def subscribe_to_mailchimp
  	SubscribeToMailchimpJob.new.async.perform(self.id)
  end

  def push_to_hubspot
  	if self.enquiry_type.important
  		PushToHubspotJob.new.async.perform(self.id)
  	end
  end

  def full_name
  	[first_name, last_name].compact.join(" ")
  end

  def self.last_seven_days
  	where('created_at > ?', Date.today - 7.days)
  end


end