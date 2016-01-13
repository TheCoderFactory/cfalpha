class CourseIntake < ActiveRecord::Base
  belongs_to :course
  belongs_to :course_location
  has_many :course_bookings, dependent: :restrict_with_exception
  has_many :promo_codes, dependent: :restrict_with_exception

  # extend FriendlyId
  # friendly_id :name, use: :slugged
  
  # after_create :add_to_calendar

  def self.chron_order
  	order(start_date: :asc)
  end

  def self.open
    where(status: 'OPEN')
  end

  def self.upcoming
  	chron_order.where('start_date >= ?', Date.today)
  end

  def self.next
    chron_order.first
  end

  def self.past
  	chron_order.where('start_date < ?', Date.today)
  end

  def bookings_revenue
  	course_bookings.where(paid: true).sum(:price)
  end

  # def add_to_calendar
  #   @event = {
  #     'summary' => self.course.name,
  #     'description' => self.course.name,
  #     'location' => self.course_location.street_address,
  #     'start' => { 'dateTime' =>  },
  #     'end' => { 'dateTime' => Chronic.parse('tomorrow 5pm') },
  #     'attendees' => [ { "email" => 'bob@example.com' },
  #     { "email" =>'sally@example.com' } ] }

  #   client = Google::APIClient.new
  #   client.authorization.access_token = current_user.token
  #   service = client.discovered_api('calendar', 'v3')

  #   @set_event = client.execute(:api_method => service.events.insert,
  #                           :parameters => {'calendarId' => current_user.email, 'sendNotifications' => true},
  #                           :body => JSON.dump(@event),
  #                           :headers => {'Content-Type' => 'application/json'})
  # end

end
