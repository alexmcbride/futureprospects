class Staff::ReportsController < Staff::StaffController
  def index
    skip_policy_scope
  end

  def courses
    authorize :report, :courses?
    @courses = policy_scope(Course).includes(:category, :college)
                   .order(:category_id, :title)
                   .paginate(page: params[:page], per_page: 20)
  end

  def course
    authorize :report, :course?

    # Default tab
    params[:tab] = 'all_applicants' if !params.key? :tab

    @course = Course.find params[:id]
    authorize @course
    @selections = (if params[:tab] == 'successful'
      @course.course_selections.successful.current
    else
      @course.course_selections.current
    end)
  end

  def colleges
    authorize :report, :colleges?

    @colleges = policy_scope College
  end

  def college
    authorize :report, :college?

    @college = College.find params[:id]
    authorize @college
  end
end

