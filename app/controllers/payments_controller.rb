class PaymentsController < ApplicationController
	def index
		if params[:booking]
			@booking = CourseBooking.find_by(guid: params[:booking])
			@course_intake = @booking.course_intake
			@course = @course_intake.course
		end
	end

	def create
		  @course_booking = CourseBooking.find_by(guid: params[:booking])
		  @payment_amount = @course_booking.price + @course_booking.gst
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
		    redirect_to thanks_path, :notice => "Thanks"
		  end

		rescue Stripe::CardError => e
		  
		    flash[:alert] = "Payment was declined by the bank. #{e.message}"
		    redirect_to payments_path(booking: @course_booking.guid)
		   
	end

end
