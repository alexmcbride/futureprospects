# require 'test_helper'
#
# class Staff::MembersControllerTest < ActionDispatch::IntegrationTest
#   setup do
#     @staff_user = staff_users(:one)
#   end
#
#   test "should get index" do
#     get staff_users_url
#     assert_response :success
#   end
#
#   test "should get new" do
#     get new_staff_user_url
#     assert_response :success
#   end
#
#   test "should create staff_user" do
#     assert_difference('Staff::User.count') do
#       post staff_users_url, params: { staff_user: {  } }
#     end
#
#     assert_redirected_to staff_user_url(Staff::User.last)
#   end
#
#   test "should show staff_user" do
#     get staff_user_url(@staff_user)
#     assert_response :success
#   end
#
#   test "should get edit" do
#     get edit_staff_user_url(@staff_user)
#     assert_response :success
#   end
#
#   test "should update staff_user" do
#     patch staff_user_url(@staff_user), params: { staff_user: {  } }
#     assert_redirected_to staff_user_url(@staff_user)
#   end
#
#   test "should destroy staff_user" do
#     assert_difference('Staff::User.count', -1) do
#       delete staff_user_url(@staff_user)
#     end
#
#     assert_redirected_to staff_users_url
#   end
# end
