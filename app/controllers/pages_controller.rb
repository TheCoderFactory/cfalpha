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
  	@new_course_bookings = CourseBooking.last_seven_days
  	@new_enquiries = Enquiry.last_seven_days
  	@new_feedback_forms = FeedbackForm.last_seven_days
  	@new_prequestionnaires = Prequestionnaire.last_seven_days
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
      @upcoming_course_intakes = CourseIntake.upcoming.limit(5)
    end
    if params[:booking]
      @booking = CourseBooking.find(params[:booking])
      @upcoming_course_intakes = CourseIntake.upcoming.limit(5)
    end
  end

end
