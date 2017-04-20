# require 'test_helper'
#
# class Staff::CollegesControllerTest < ActionDispatch::IntegrationTest
#   setup do
#     @staff_college = staff_colleges(:one)
#   end
#
#   test "should get index" do
#     get staff_colleges_url
#     assert_response :success
#   end
#
#   test "should get new" do
#     get new_staff_college_url
#     assert_response :success
#   end
#
#   test "should create staff_college" do
#     assert_difference('Staff::College.count') do
#       post staff_colleges_url, params: { staff_college: {  } }
#     end
#
#     assert_redirected_to staff_college_url(Staff::College.last)
#   end
#
#   test "should show staff_college" do
#     get staff_college_url(@staff_college)
#     assert_response :success
#   end
#
#   test "should get edit" do
#     get edit_staff_college_url(@staff_college)
#     assert_response :success
#   end
#
#   test "should update staff_college" do
#     patch staff_college_url(@staff_college), params: { staff_college: {  } }
#     assert_redirected_to staff_college_url(@staff_college)
#   end
#
#   test "should destroy staff_college" do
#     assert_difference('Staff::College.count', -1) do
#       delete staff_college_url(@staff_college)
#     end
#
#     assert_redirected_to staff_colleges_url
#   end
# end
