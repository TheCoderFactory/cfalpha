class PagesController < ApplicationController
  skip_before_action :authenticate_user!, except: [:admin, :settings]
  layout 'admin', only: [:admin, :settings]
  def home
    @upcoming_course_intakes = CourseIntake.upcoming.limit(5)
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

  def contact
  end

  def settings
    @course_types = CourseType.all
    @course_locations = CourseLocation.all
    @enquiry_types = EnquiryType.all
  end

  def about
  end

  def beginner

  end

  def builder

  end

  def business

  end

  def fasttrack

  end

  def schools

  end

end
