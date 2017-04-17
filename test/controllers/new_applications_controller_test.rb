require 'test_helper'

class NewApplicationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get applications_index_url
    assert_response :success
  end

  test "should get profile" do
    get applications_profile_url
    assert_response :success
  end

  test "should get education" do
    get applications_education_url
    assert_response :success
  end

  test "should get employment" do
    get applications_employment_url
    assert_response :success
  end

  test "should get statement" do
    get applications_statement_url
    assert_response :success
  end

  test "should get courses" do
    get applications_courses_url
    assert_response :success
  end

  test "should get submit" do
    get applications_submit_url
    assert_response :success
  end

end
