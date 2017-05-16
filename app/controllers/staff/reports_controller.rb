class Staff::ReportsController < Staff::StaffController
  def index
    skip_policy_scope
  end

  def courses
    skip_authorization
  end

  def applications
    skip_authorization
  end
end

