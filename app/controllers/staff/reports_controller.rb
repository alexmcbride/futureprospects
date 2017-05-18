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

  # GET /staff/reports/colleges/:id/course_applicants
  def college_course_applicants
    authorize :report, :college?
    college = College.find params[:id]
    render json: CourseSelection.current.college(college).group('courses.title').count
  end

  # GET /staff/reports/colleges/:id/course_applicants
  def college_offers
    authorize :report, :college?
    college = College.find params[:id]
    render json: CourseSelection.current.college(college).group(:college_offer).count.map {|k, v| [ k ? k.titleize : 'Pending', v]}
  end

  # GET /staff/reports/colleges/:id/course_applicants
  def college_choices
    authorize :report, :college?
    college = College.find params[:id]
    render json: CourseSelection.current.college(college).group(:student_choice).count.map {|k, v| [ k ? k.titleize : 'Pending', v] if k != 'skipped'}.compact
  end

  # GET /staff/reports/colleges/:id/gender
  def college_genders
    authorize :report, :college?
    college = College.find params[:id]
    render json: Application.current.college(college).group(:gender).count
  end

  # GET /staff/reports/colleges/:id/gender
  def college_birth_dates
    authorize :report, :college?
    college = College.find params[:id]
    render json: Application.current.college(college).group('EXTRACT(YEAR FROM age(CURRENT_DATE, birth_date))').count
  end

  # GET /staff/reports/colleges/:id/gender
  def college_schools
    authorize :report, :college?
    college = College.find params[:id]
    render json: Application.current.college(college).joins(:schools).group('schools.name').count
  end
end
