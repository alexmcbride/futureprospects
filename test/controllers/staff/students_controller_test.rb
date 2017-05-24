require 'test_helper'

class Staff::StudentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @staff_student = staff_students(:one)
  end

  test "should get index" do
    get staff_students_url
    assert_response :success
  end

  test "should get new" do
    get new_staff_student_url
    assert_response :success
  end

  test "should create staff_student" do
    assert_difference('Staff::Student.count') do
      post staff_students_url, params: { staff_student: { email: @staff_student.email, family_name: @staff_student.family_name, first_name: @staff_student.first_name, national_insurance_number: @staff_student.national_insurance_number, scottish_candidate_number: @staff_student.scottish_candidate_number, username: @staff_student.username } }
    end

    assert_redirected_to staff_student_url(Staff::Student.last)
  end

  test "should show staff_student" do
    get staff_student_url(@staff_student)
    assert_response :success
  end

  test "should get edit" do
    get edit_staff_student_url(@staff_student)
    assert_response :success
  end

  test "should update staff_student" do
    patch staff_student_url(@staff_student), params: { staff_student: { email: @staff_student.email, family_name: @staff_student.family_name, first_name: @staff_student.first_name, national_insurance_number: @staff_student.national_insurance_number, scottish_candidate_number: @staff_student.scottish_candidate_number, username: @staff_student.username } }
    assert_redirected_to staff_student_url(@staff_student)
  end

  test "should destroy staff_student" do
    assert_difference('Staff::Student.count', -1) do
      delete staff_student_url(@staff_student)
    end

    assert_redirected_to staff_students_url
  end
end
