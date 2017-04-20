# require 'test_helper'
#
# class Staff::CoursesControllerTest < ActionDispatch::IntegrationTest
#   setup do
#     @staff_course = staff_courses(:one)
#   end
#
#   test "should get index" do
#     get staff_courses_url
#     assert_response :success
#   end
#
#   test "should get new" do
#     get new_staff_course_url
#     assert_response :success
#   end
#
#   test "should create staff_course" do
#     assert_difference('Staff::Course.count') do
#       post staff_courses_url, params: { staff_course: {  } }
#     end
#
#     assert_redirected_to staff_course_url(Staff::Course.last)
#   end
#
#   test "should show staff_course" do
#     get staff_course_url(@staff_course)
#     assert_response :success
#   end
#
#   test "should get edit" do
#     get edit_staff_course_url(@staff_course)
#     assert_response :success
#   end
#
#   test "should update staff_course" do
#     patch staff_course_url(@staff_course), params: { staff_course: {  } }
#     assert_redirected_to staff_course_url(@staff_course)
#   end
#
#   test "should destroy staff_course" do
#     assert_difference('Staff::Course.count', -1) do
#       delete staff_course_url(@staff_course)
#     end
#
#     assert_redirected_to staff_courses_url
#   end
# end
