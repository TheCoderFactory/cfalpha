class CourseBookingsController < ApplicationController
  before_action :set_course_booking, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:new, :create]
  layout 'admin', except: :new
  # GET /course_bookings
  # GET /course_bookings.json
  def index
    @upcoming_intakes = CourseIntake.includes(:course_bookings).upcoming
    @past_intakes = CourseIntake.includes(:course_bookings).past
  end

  # GET /course_bookings/1
  # GET /course_bookings/1.json
  def show
  end

  # GET /course_bookings/new
  def new
    @course_booking = CourseBooking.new
  end

  # GET /course_bookings/1/edit
  def edit
  end

  # POST /course_bookings
  # POST /course_bookings.json
  def create
    @course_booking = CourseBooking.new(course_booking_params)

    respond_to do |format|
      if @course_booking.save
        format.html { redirect_to @course_booking, notice: 'Course booking was successfully created.' }
        format.json { render :show, status: :created, location: @course_booking }
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
      params.require(:course_booking).permit(:course_intake_id, :user_id, :price, :promo_code, :paid, :completed)
    end
end
