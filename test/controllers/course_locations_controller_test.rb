require 'test_helper'

class CourseLocationsControllerTest < ActionController::TestCase
  setup do
    @course_location = course_locations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:course_locations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create course_location" do
    assert_difference('CourseLocation.count') do
      post :create, course_location: { address_one: @course_location.address_one, address_two: @course_location.address_two, city: @course_location.city, country: @course_location.country, latitude: @course_location.latitude, longitude: @course_location.longitude, name: @course_location.name, postcode: @course_location.postcode, slug: @course_location.slug, state: @course_location.state, suburb: @course_location.suburb }
    end

    assert_redirected_to course_location_path(assigns(:course_location))
  end

  test "should show course_location" do
    get :show, id: @course_location
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @course_location
    assert_response :success
  end

  test "should update course_location" do
    patch :update, id: @course_location, course_location: { address_one: @course_location.address_one, address_two: @course_location.address_two, city: @course_location.city, country: @course_location.country, latitude: @course_location.latitude, longitude: @course_location.longitude, name: @course_location.name, postcode: @course_location.postcode, slug: @course_location.slug, state: @course_location.state, suburb: @course_location.suburb }
    assert_redirected_to course_location_path(assigns(:course_location))
  end

  test "should destroy course_location" do
    assert_difference('CourseLocation.count', -1) do
      delete :destroy, id: @course_location
    end

    assert_redirected_to course_locations_path
  end
end
