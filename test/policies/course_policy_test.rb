require 'test_helper'

class CoursePolicyTest < ActiveSupport::TestCase
  fixtures :users, :roles, :users_roles

  def test_scope
  end

  test 'user with correct role should get courses show ' do
    @user = users(:user_admin)
    @course = courses(:course_one)
    policy = CoursePolicy.new @user, @course
    assert(policy.show?)
  end

  test 'user with incorrect role does not get courses show ' do
    @user = users(:user_two)
    @course = courses(:course_one)
    policy = CoursePolicy.new @user, @course
    assert_not(policy.show?)
  end

  def test_new

  end

  def test_edit

  end

  def test_remove

  end
end
