require 'test_helper'

class CoursePolicyTest < ActiveSupport::TestCase
  fixtures :users, :roles, :users_roles

  setup do
    @user = users(:user_admin_one)
    @course = courses(:course_one)
  end

  def test_scope
  end

  def test_show
    policy = CoursePolicy.new @user, @course
    assert(policy.show?)
  end

  def test_create
  end

  def test_update
  end

  def test_destroy
  end
end
