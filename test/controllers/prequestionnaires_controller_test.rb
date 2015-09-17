require 'test_helper'

class PrequestionnairesControllerTest < ActionController::TestCase
  setup do
    @prequestionnaire = prequestionnaires(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:prequestionnaires)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create prequestionnaire" do
    assert_difference('Prequestionnaire.count') do
      post :create, prequestionnaire: { background: @prequestionnaire.background, course_booking_id: @prequestionnaire.course_booking_id, experience: @prequestionnaire.experience, hobbies: @prequestionnaire.hobbies, reason: @prequestionnaire.reason }
    end

    assert_redirected_to prequestionnaire_path(assigns(:prequestionnaire))
  end

  test "should show prequestionnaire" do
    get :show, id: @prequestionnaire
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @prequestionnaire
    assert_response :success
  end

  test "should update prequestionnaire" do
    patch :update, id: @prequestionnaire, prequestionnaire: { background: @prequestionnaire.background, course_booking_id: @prequestionnaire.course_booking_id, experience: @prequestionnaire.experience, hobbies: @prequestionnaire.hobbies, reason: @prequestionnaire.reason }
    assert_redirected_to prequestionnaire_path(assigns(:prequestionnaire))
  end

  test "should destroy prequestionnaire" do
    assert_difference('Prequestionnaire.count', -1) do
      delete :destroy, id: @prequestionnaire
    end

    assert_redirected_to prequestionnaires_path
  end
end
