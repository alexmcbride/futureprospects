require 'test_helper'

class CollegesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @college = colleges(:college_one)
  end

  test 'should get index' do
    get colleges_url
    assert_response :success
  end

  test 'should show college' do
    get college_url(@college)
    assert_response :success
  end
end
