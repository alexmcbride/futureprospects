class Staff::ReportsController < Staff::StaffController
  def index
    skip_policy_scope
  end

  def courses
    skip_authorization

    # •	student name details
    # •	qualifications
    # •	previous educational establishment
    # •	decision
    # •	totals – number of students by decision category.

    @courses = policy_scope(Course).includes(:category, :college)
                   .order(:category_id, :title)
                   .paginate(page: params[:page], per_page: 20)
  end

  def course
    skip_authorization

    # Default tab
    params[:tab] = 'all_applicants' if !params.key? :tab

    @course = Course.find params[:id]
    @selections = (if params[:tab] == 'successful'
      @course.course_selections.successful.current
    else
      @course.course_selections.current
    end)
  end

  def applications
    skip_authorization
  end
end

