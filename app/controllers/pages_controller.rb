class PagesController < ApplicationController
  skip_before_action :authenticate_user!, except: [:admin, :settings, :admin_booking]
  layout 'admin', only: [:admin, :settings, :admin_booking]
  def home
    @upcoming_course_intakes = CourseIntake.includes(:course, :course_location).upcoming.open.limit(5)
    @workshops = Course.includes(:course_type).get_courses_by_type('Workshop')
    @part_time_courses = Course.includes(:course_type).get_courses_by_type('Part Time')
    @business_courses = Course.includes(:course_type).get_courses_by_type('Business')
    @school_courses = Course.includes(:course_type).get_courses_by_type('School')
    @fast_track = Course.includes(:course_type).get_courses_by_type('Full Time Intensive')
    # @courses = Course.active
  end

  def admin
  	# unless current_user.has_role? :admin
  	# 	redirect_to root_path
  	# end
  	@new_course_bookings = CourseBooking.this_week
  	@new_enquiries = Enquiry.this_week
  	@new_feedback_forms = FeedbackForm.this_week
  	@new_prequestionnaires = Prequestionnaire.this_week
    @grouped_course_bookings = CourseBooking.group_by_day(:created_at, format: "%d%b", range: 1.week.ago.midnight..Time.now, time_zone: "Sydney")
    @grouped_enquiries = Enquiry.group_by_day(:created_at, format: "%a %d%b", range: 1.week.ago.midnight..Time.now, time_zone: "Sydney")
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
    @workshops = Course.includes(:course_type, [{course_intakes: :course_location}]).get_courses_by_type('Workshop')
  end
  # Category.includes(articles: [{ comments: :guest }, :tags]).find(1)
  def part_time
    @course_type = CourseType.find_by(name: 'Part Time')
    @part_time_courses = @course_type.courses.includes([{course_intakes: :course_location}]).active
  end

  def business
    @business_courses = Course.includes(:course_type, [{course_intakes: :course_location}]).get_courses_by_type('Business')
    @school_courses = Course.includes(:course_type, [{course_intakes: :course_location}]).get_courses_by_type('School')
  end

  def fasttrack

  end

  def community

  end

  def thanks
    @user = 0
    if params[:welcome]
      @user = User.find(params[:welcome])
    elsif params[:booking]
      @booking = CourseBooking.find(params[:booking])
    elsif params[:enquiry]
      @enquiry = Enquiry.find(params[:enquiry])
    end
    @upcoming_course_intakes = CourseIntake.includes(:course, :course_location).upcoming.limit(5)
  end

  def admin_booking
    if current_user.has_role? :admin
      @course_booking = CourseBooking.new
      @upcoming_intakes = CourseIntake.includes(:course).upcoming.limit(5)
      @users = User.all
    else
      redirect_to root_path
    end
  end

  def coder_factory_club
  end

end
