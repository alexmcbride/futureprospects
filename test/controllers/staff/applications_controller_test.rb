require 'test_helper'

class Staff::ApplicationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @staff_application = staff_applications(:one)
  end

  test "should get index" do
    get staff_applications_url
    assert_response :success
  end

  test "should get new" do
    get new_staff_application_url
    assert_response :success
  end

  test "should create staff_application" do
    assert_difference('Staff::Application.count') do
      post staff_applications_url, params: { staff_application: {  } }
    end

    assert_redirected_to staff_application_url(Staff::Application.last)
  end

  test "should show staff_application" do
    get staff_application_url(@staff_application)
    assert_response :success
  end

  test "should get edit" do
    get edit_staff_application_url(@staff_application)
    assert_response :success
  end

  test "should update staff_application" do
    patch staff_application_url(@staff_application), params: { staff_application: {  } }
    assert_redirected_to staff_application_url(@staff_application)
  end

  test "should destroy staff_application" do
    assert_difference('Staff::Application.count', -1) do
      delete staff_application_url(@staff_application)
    end

    assert_redirected_to staff_applications_url
  end
end
