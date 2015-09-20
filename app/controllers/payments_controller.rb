class PaymentsController < ApplicationController
	def index
		if params[:booking]
			@booking = CourseBooking.find_by(guid: params[:booking])
			@course_intake = @booking.course_intake
			@course = @course_intake.course
		end
	end

	def create
	end

end
