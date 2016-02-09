class CourseBookingsController < ApplicationController
  before_action :set_course_booking, only: [:show, :edit, :update, :destroy]
  layout 'admin', except: [:new, :confirm]

  def confirm
    @course_intake = CourseIntake.find(params[:intake_id])
    @course_booking = CourseBooking.new
  end
  # GET /course_bookings
  # GET /course_bookings.json
  def index
    @upcoming_intakes = CourseIntake.includes(:course, :course_location, course_bookings: :user).upcoming.paginate(:page => params[:page], :per_page => 10)
    @past_intakes = CourseIntake.includes(:course, :course_location, course_bookings: :user).past.reverse_order
  end

  # GET /course_bookings/1
  # GET /course_bookings/1.json
  def show
    # if @course_booking.promo_code.nil?
    #   @promo_code = false
    # else
    #   if PromoCode.code_is_valid?(@course_booking.promo_code)


  end

  # GET /course_bookings/new
  def new
    @course_booking = CourseBooking.new
    if params[:intake_id]
      @course_intake = CourseIntake.find(params[:intake_id])
      @course = @course_intake.course
    end
  end

  # GET /course_bookings/1/edit
  def edit
    @upcoming_intakes = CourseIntake.includes(:course).upcoming.limit(5)
    @users = User.all
  end

  # POST /course_bookings
  # POST /course_bookings.json
  def create
    @course_booking = CourseBooking.new(course_booking_params)
    if @course_booking.user.nil?
      @course_booking.user = current_user
    end
    @course_intake = @course_booking.course_intake
    @course_booking.price = @course_intake.price.to_d
    respond_to do |format|
      if @course_booking.save
        current_user.add_role :student
        if @course_booking.price > 0 and @course_booking.price < 1000.0
          format.html { redirect_to payments_path(booking: @course_booking.guid), notice: 'Your course booking was successfully created.' }
        elsif @course_booking.price >= 1000.0
          format.html { redirect_to choose_payments_path(booking: @course_booking.guid)}
        else
          BookingMailerJob.perform_async(@course_booking.id)
          format.html { redirect_to thanks_path(booking: @course_booking.id), notice: 'Your course booking was successfully created.' }
        end
      else
        format.html { render :new }
        format.json { render json: @course_booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /course_bookings/1
  # PATCH/PUT /course_bookings/1.json
  def update
    respond_to do |format|
      if @course_booking.update(course_booking_params)
        format.html { redirect_to @course_booking, notice: 'Course booking was successfully updated.' }
        format.json { render :show, status: :ok, location: @course_booking }
      else
        format.html { render :edit }
        format.json { render json: @course_booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /course_bookings/1
  # DELETE /course_bookings/1.json
  def destroy
    @course_booking.destroy
    respond_to do |format|
      format.html { redirect_to course_bookings_url, notice: 'Course booking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course_booking
      @course_booking = CourseBooking.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_booking_params
      params.require(:course_booking).permit(:gst, :course_intake_id, :user_id, :price, :promo_code, :paid, :completed)
    end
end
