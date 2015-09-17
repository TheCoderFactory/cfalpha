require 'test_helper'

class EnquiryTypesControllerTest < ActionController::TestCase
  setup do
    @enquiry_type = enquiry_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:enquiry_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create enquiry_type" do
    assert_difference('EnquiryType.count') do
      post :create, enquiry_type: { description: @enquiry_type.description, name: @enquiry_type.name }
    end

    assert_redirected_to enquiry_type_path(assigns(:enquiry_type))
  end

  test "should show enquiry_type" do
    get :show, id: @enquiry_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @enquiry_type
    assert_response :success
  end

  test "should update enquiry_type" do
    patch :update, id: @enquiry_type, enquiry_type: { description: @enquiry_type.description, name: @enquiry_type.name }
    assert_redirected_to enquiry_type_path(assigns(:enquiry_type))
  end

  test "should destroy enquiry_type" do
    assert_difference('EnquiryType.count', -1) do
      delete :destroy, id: @enquiry_type
    end

    assert_redirected_to enquiry_types_path
  end
end
