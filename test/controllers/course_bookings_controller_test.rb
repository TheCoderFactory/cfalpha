require 'test_helper'

class CourseBookingsControllerTest < ActionController::TestCase
  setup do
    @course_booking = course_bookings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:course_bookings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create course_booking" do
    assert_difference('CourseBooking.count') do
      post :create, course_booking: { completed: @course_booking.completed, course_intake_id: @course_booking.course_intake_id, paid: @course_booking.paid, price: @course_booking.price, promo_code: @course_booking.promo_code, user_id: @course_booking.user_id }
    end

    assert_redirected_to course_booking_path(assigns(:course_booking))
  end

  test "should show course_booking" do
    get :show, id: @course_booking
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @course_booking
    assert_response :success
  end

  test "should update course_booking" do
    patch :update, id: @course_booking, course_booking: { completed: @course_booking.completed, course_intake_id: @course_booking.course_intake_id, paid: @course_booking.paid, price: @course_booking.price, promo_code: @course_booking.promo_code, user_id: @course_booking.user_id }
    assert_redirected_to course_booking_path(assigns(:course_booking))
  end

  test "should destroy course_booking" do
    assert_difference('CourseBooking.count', -1) do
      delete :destroy, id: @course_booking
    end

    assert_redirected_to course_bookings_path
  end
end
