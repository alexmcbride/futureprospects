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

    @course = Course.find params[:id]

    params[:tab] = 'successful' if !params.key? :tab

    @selections = (if params[:tab] == 'successful'
      @course.course_selections.successful
    else
      @course.course_selections
    end)
  end

  def applications
    skip_authorization
  end
end

