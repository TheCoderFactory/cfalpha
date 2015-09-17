require 'test_helper'

class FeedbackFormsControllerTest < ActionController::TestCase
  setup do
    @feedback_form = feedback_forms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:feedback_forms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create feedback_form" do
    assert_difference('FeedbackForm.count') do
      post :create, feedback_form: { another: @feedback_form.another, best_part: @feedback_form.best_part, comments: @feedback_form.comments, course_id: @feedback_form.course_id, course_location_id: @feedback_form.course_location_id, expectations: @feedback_form.expectations, recommend: @feedback_form.recommend, satisfaction: @feedback_form.satisfaction, testimonial: @feedback_form.testimonial, value: @feedback_form.value }
    end

    assert_redirected_to feedback_form_path(assigns(:feedback_form))
  end

  test "should show feedback_form" do
    get :show, id: @feedback_form
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @feedback_form
    assert_response :success
  end

  test "should update feedback_form" do
    patch :update, id: @feedback_form, feedback_form: { another: @feedback_form.another, best_part: @feedback_form.best_part, comments: @feedback_form.comments, course_id: @feedback_form.course_id, course_location_id: @feedback_form.course_location_id, expectations: @feedback_form.expectations, recommend: @feedback_form.recommend, satisfaction: @feedback_form.satisfaction, testimonial: @feedback_form.testimonial, value: @feedback_form.value }
    assert_redirected_to feedback_form_path(assigns(:feedback_form))
  end

  test "should destroy feedback_form" do
    assert_difference('FeedbackForm.count', -1) do
      delete :destroy, id: @feedback_form
    end

    assert_redirected_to feedback_forms_path
  end
end
