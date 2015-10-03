class PagesController < ApplicationController
  skip_before_action :authenticate_user!, except: [:admin, :settings]
  layout 'admin', only: [:admin, :settings]
  def home
    @upcoming_course_intakes = CourseIntake.upcoming.limit(5)
    @workshops = Course.get_courses_by_type('Workshop')
    @part_time_courses = Course.get_courses_by_type('Part Time')
    @business_courses = Course.get_courses_by_type('Business')
    @school_courses = Course.get_courses_by_type('School')
    @fast_track = Course.get_courses_by_type('Full Time Intensive')
  end

  def admin
  	# unless current_user.has_role? :admin
  	# 	redirect_to root_path
  	# end
  	@new_course_bookings = CourseBooking.this_week
  	@new_enquiries = Enquiry.this_week
  	@new_feedback_forms = FeedbackForm.this_week
  	@new_prequestionnaires = Prequestionnaire.this_week
    @grouped_course_bookings = CourseBooking.group_by_day(:created_at, format: "%a", range: 1.week.ago.midnight..Time.now, time_zone: "Sydney")
    @grouped_enquiries = Enquiry.group_by_day(:created_at, format: "%a", range: 1.week.ago.midnight..Time.now, time_zone: "Sydney")
    @course_bookings_this_week = CourseBooking.this_week
    @enquiries_this_week = Enquiry.this_week
    @course_bookings_last_week = CourseBooking.last_week
    @enquiries_last_month = Enquiry.last_month
    @enquiries_last_week = Enquiry.last_week
    @course_bookings_last_month = CourseBooking.last_month
    authorize! :read, @new_course_bookings
  end

  def privacy
  end

  def contact
    @enquiry = Enquiry.new
  end

  def settings
    @course_types = CourseType.all
    @course_locations = CourseLocation.all
    @enquiry_types = EnquiryType.all
    authorize! :read, @course_types
  end

  def about
  end

  def beginner
    @workshops = Course.get_courses_by_type('Workshop')
  end

  def part_time
    @part_time_courses = Course.get_courses_by_type('Part Time')
  end

  def business
    @business_courses = Course.get_courses_by_type('Business')
    @school_courses = Course.get_courses_by_type('School')
  end

  def fasttrack

  end

  def community

  end

  def thanks
    if params[:welcome]
      @user = User.find(params[:welcome])
    elsif params[:booking]
      @booking = CourseBooking.find(params[:booking])
    elsif params[:enquiry]
      @enquiry = Enquiry.find(params[:enquiry])
    end
    @upcoming_course_intakes = CourseIntake.upcoming.limit(5)
  end

end
