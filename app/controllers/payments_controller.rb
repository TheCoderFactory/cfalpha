class PaymentsController < ApplicationController
	skip_before_action :authenticate_user!, only: :choose

	def index
		@course_booking = CourseBooking.includes(:course_intake).find_by(guid: params[:booking])
		@course_intake = CourseIntake.includes(:course).find(@course_booking.course_intake.id)
		@payment_amount = @course_booking.price + @course_booking.gst
		if params[:payment_option] == 'deposit'
			@payment_amount = 500.0
		else
			@payment_amount = @course_booking.price + @course_booking.gst
		end
	end

	def choose
		@course_booking = CourseBooking.includes(:course_intake).find_by(guid: params[:booking])
		@course_intake = CourseIntake.includes(:course).find(@course_booking.course_intake.id)
	end

	def create
		  @course_booking = CourseBooking.find_by(guid: params[:booking])
		  @user = current_user
		  @intake = @course_booking.course_intake
		  @payment_amount = params[:payment_amount].to_d
		  Stripe.api_key = Rails.configuration.stripe[:secret_key]
		  token = params[:stripeToken]

		  customer = Stripe::Customer.create(
		    :source => token,
  			:description => @course_booking.user.email
		  )

		  charge = Stripe::Charge.create(
		      :amount => (@payment_amount * 100).to_i, # in cents
		      :currency => "aud",
		      :description => "Booking number: " + @course_booking.id.to_s,
		      :customer => customer.id
		  )
		  Rails.logger.debug(puts "Charge: " + charge["paid"].to_s)
		  if charge["paid"] == true
		    @payment = Payment.create(course_booking_id: @course_booking.id, amount: @payment_amount)
		    @course_booking.mark_as_paid
		    BookingMailerJob.new.async.perform(@course_booking.id)
		    redirect_to thanks_path(booking: @course_booking.id), :notice => "Thanks"
		  end

		rescue Stripe::CardError => e

		    flash[:alert] = "Please try a different card. #{e.message}"
		    redirect_to payments_path(booking: @course_booking.guid)

	end

end
