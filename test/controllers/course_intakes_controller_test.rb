require 'test_helper'

class CourseIntakesControllerTest < ActionController::TestCase
  setup do
    @course_intake = course_intakes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:course_intakes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create course_intake" do
    assert_difference('CourseIntake.count') do
      post :create, course_intake: { course_id: @course_intake.course_id, course_location_id: @course_intake.course_location_id, days_of_week: @course_intake.days_of_week, end_date: @course_intake.end_date, end_time: @course_intake.end_time, price: @course_intake.price, slug: @course_intake.slug, start_date: @course_intake.start_date, start_time: @course_intake.start_time, status: @course_intake.status }
    end

    assert_redirected_to course_intake_path(assigns(:course_intake))
  end

  test "should show course_intake" do
    get :show, id: @course_intake
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @course_intake
    assert_response :success
  end

  test "should update course_intake" do
    patch :update, id: @course_intake, course_intake: { course_id: @course_intake.course_id, course_location_id: @course_intake.course_location_id, days_of_week: @course_intake.days_of_week, end_date: @course_intake.end_date, end_time: @course_intake.end_time, price: @course_intake.price, slug: @course_intake.slug, start_date: @course_intake.start_date, start_time: @course_intake.start_time, status: @course_intake.status }
    assert_redirected_to course_intake_path(assigns(:course_intake))
  end

  test "should destroy course_intake" do
    assert_difference('CourseIntake.count', -1) do
      delete :destroy, id: @course_intake
    end

    assert_redirected_to course_intakes_path
  end
end
