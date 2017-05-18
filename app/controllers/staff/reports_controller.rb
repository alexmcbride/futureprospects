class Staff::ReportsController < Staff::StaffController
  # GET /staff/reports
  def index
    skip_policy_scope
  end

  # GET /staff/reports/courses
  def courses
    authorize :report, :courses?
    @courses = policy_scope(Course).includes(:category, :college)
                   .order(:category_id, :title)
                   .paginate(page: params[:page], per_page: 20)
  end

  # GET /staff/reports/course/:id
  def course
    authorize :report, :course?
    params[:tab] = get_tab
    @course = Course.find params[:id]
    authorize @course
    @selections = get_course_selections_for_tab
  end

  # GET /staff/reports/courses/:id/course_offers
  def course_offers
    authorize :report, :course?
    render json: get_course_selections_for_tab.group(:college_offer).count.map{|k,v| [k ? k.titleize : 'None',v]}.compact
  end

  # GET /staff/reports/courses/:id/course_replies
  def course_replies
    authorize :report, :course?
    render json: get_course_selections_for_tab.group(:student_choice).count.map{|k,v| [k ? k.titleize : 'Pending',v] if k != 'skipped'}.compact
  end

  # GET /staff/reports/courses/:id/course_schools
  def course_schools
    authorize :report, :course?
    render json: get_course_selections_for_tab.schools.group('schools.name').count
  end

  # GET /staff/reports/courses/:id/course_applications_by_week
  def course_applications_by_week
    authorize :report, :course?
    render json: get_course_selections_for_tab.joins(:application).group_by_week('applications.submitted_date').count
  end

  # GET /staff/reports/colleges
  def colleges
    authorize :report, :colleges?
    @colleges = policy_scope College
  end

  # GET /staff/reports/college/:id
  def college
    authorize :report, :college?
    @college = College.find params[:id]
    authorize @college
  end

  # GET /staff/reports/colleges/:id/course_applicants
  def college_course_applicants
    authorize :report, :college?
    render json: CourseSelection.current.college(params[:id]).group('courses.title').count
  end

  # GET /staff/reports/colleges/:id/course_applicants
  def college_offers
    authorize :report, :college?
    render json: CourseSelection.current.college(params[:id]).group(:college_offer).count.map {|k, v| [ k ? k.titleize : 'Pending', v]}
  end

  # GET /staff/reports/colleges/:id/course_applicants
  def college_choices
    authorize :report, :college?
    render json: CourseSelection.current.college(params[:id]).group(:student_choice).count.map {|k, v| [ k ? k.titleize : 'Pending', v] if k != 'skipped'}.compact
  end

  # GET /staff/reports/colleges/:id/gender
  def college_genders
    authorize :report, :college?
    render json: Application.current.college(params[:id]).group(:gender).count
  end

  # GET /staff/reports/colleges/:id/gender
  def college_birth_dates
    authorize :report, :college?
    render json: Application.current.college(params[:id]).group('EXTRACT(YEAR FROM age(CURRENT_DATE, birth_date))').count
  end

  # GET /staff/reports/colleges/:id/gender
  def college_schools
    authorize :report, :college?
    render json: Application.current.college(params[:id]).joins(:schools).group('schools.name').count
  end

  private
    # Gets the course_selections for the selected tab.
    def get_course_selections_for_tab
      if get_tab == :successful
         Course.find(params[:id]).course_selections.current.successful
       else
         Course.find(params[:id]).course_selections.current
       end
    end

    # Gets the selected or default tab.
    def get_tab
      if params.key? :tab
        params[:tab].to_sym
      end or :all_applicants
    end
end
