require 'test_helper'

class Staff::CategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @staff_category = staff_categories(:one)
  end

  test "should get index" do
    get staff_categories_url
    assert_response :success
  end

  test "should get new" do
    get new_staff_category_url
    assert_response :success
  end

  test "should create staff_category" do
    assert_difference('Staff::Category.count') do
      post staff_categories_url, params: { staff_category: {  } }
    end

    assert_redirected_to staff_category_url(Staff::Category.last)
  end

  test "should show staff_category" do
    get staff_category_url(@staff_category)
    assert_response :success
  end

  test "should get edit" do
    get edit_staff_category_url(@staff_category)
    assert_response :success
  end

  test "should update staff_category" do
    patch staff_category_url(@staff_category), params: { staff_category: {  } }
    assert_redirected_to staff_category_url(@staff_category)
  end

  test "should destroy staff_category" do
    assert_difference('Staff::Category.count', -1) do
      delete staff_category_url(@staff_category)
    end

    assert_redirected_to staff_categories_url
  end
end
