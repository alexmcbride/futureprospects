require 'test_helper'

class CoursesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @course = courses(:course_one)
  end

  test 'should get index' do
    get courses_url
    assert_response :success
  end

  test 'should get category' do
    category = categories(:category_one)
    get courses_category_url(category)
    assert_response :success
  end

  test 'should show course' do
    get course_url(@course)
    assert_response :success
  end

  test 'should return search results' do
    get courses_search_url, params: {format: :json, term: 'course'}
    assert_response :success
    body = JSON.parse(response.body)
    puts body
    assert_equal @course.id, body.first['id']
    assert_equal @course.title, body.first['title']
    assert_equal @course.status, body.first['status']
    assert_equal @course.college.name, body.first['college']['name']
  end
end
