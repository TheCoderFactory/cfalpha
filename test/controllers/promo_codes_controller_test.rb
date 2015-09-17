require 'test_helper'

class PromoCodesControllerTest < ActionController::TestCase
  setup do
    @promo_code = promo_codes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:promo_codes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create promo_code" do
    assert_difference('PromoCode.count') do
      post :create, promo_code: { code: @promo_code.code, course_intake_id: @promo_code.course_intake_id, creator_id: @promo_code.creator_id, date_used: @promo_code.date_used, description: @promo_code.description, expiry_date: @promo_code.expiry_date, name: @promo_code.name, percent_value: @promo_code.percent_value, price_value: @promo_code.price_value, user_id: @promo_code.user_id }
    end

    assert_redirected_to promo_code_path(assigns(:promo_code))
  end

  test "should show promo_code" do
    get :show, id: @promo_code
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @promo_code
    assert_response :success
  end

  test "should update promo_code" do
    patch :update, id: @promo_code, promo_code: { code: @promo_code.code, course_intake_id: @promo_code.course_intake_id, creator_id: @promo_code.creator_id, date_used: @promo_code.date_used, description: @promo_code.description, expiry_date: @promo_code.expiry_date, name: @promo_code.name, percent_value: @promo_code.percent_value, price_value: @promo_code.price_value, user_id: @promo_code.user_id }
    assert_redirected_to promo_code_path(assigns(:promo_code))
  end

  test "should destroy promo_code" do
    assert_difference('PromoCode.count', -1) do
      delete :destroy, id: @promo_code
    end

    assert_redirected_to promo_codes_path
  end
end
