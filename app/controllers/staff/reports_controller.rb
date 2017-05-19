class Staff::ReportsController < Staff::StaffController
  # GET /staff/reports
  def index
    authorize :report, :colleges?
    @colleges = policy_scope College
  end

  # GET /staff/reports/college/:id
  def college
    authorize :report, :college?
    @college = College.find params[:id]
    @courses = policy_scope(Course)
                   .where(college: @college)
                   .includes(:category, :college)
                   .order(:category_id, :title)
                   .paginate(page: params[:page], per_page: 20)
  end

  def show_college
    authorize :report, :college?
    @college = College.find params[:id]
  end

  # GET /staff/reports/course/:id
  def course
    authorize :report, :course?
    @course = Course.find params[:id]
    authorize @course
    @selections = @course.course_selections.current
  end


  ##
  # JSON background loaders for charts
  #

  def course_genders
    authorize :report, :course?
    render json: Application.current.joins(:course_selections).where('course_selections.course_id': params[:id]).group(:gender).count.map{|k,v|[k.humanize, v] }
  end

  def course_ages
    authorize :report, :course?
    render json: Application.current.joins(:course_selections).where('course_selections.course_id': params[:id]).group('EXTRACT(YEAR FROM age(CURRENT_DATE, birth_date))').count
  end

  # GET /staff/reports/courses/:id/course_offers
  def course_offers
    authorize :report, :course?
    render json: CourseSelection.current.college(params[:id]).group(:college_offer).count.map{|k,v| [k ? k.titleize : 'None',v]}.compact
  end

  # GET /staff/reports/courses/:id/course_replies
  def course_replies
    authorize :report, :course?
    render json: CourseSelection.current.college(params[:id]).group(:student_choice).count.map{|k,v| [k ? k.titleize : 'Pending',v] if k != 'skipped'}.compact
  end

  # GET /staff/reports/courses/:id/course_schools
  def course_schools
    authorize :report, :course?
    render json: CourseSelection.current.college(params[:id]).schools.group('schools.name').count
  end

  # GET /staff/reports/courses/:id/course_applications_by_week
  def course_applications_by_week
    authorize :report, :course?
    render json: CourseSelection.current.college(params[:id]).joins(:application).group_by_week('applications.submitted_date').count
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

  def college_applications_by_week
    authorize :report, :college?
    render json: Application.current.college(params[:id]).group_by_week('applications.created_at').count
  end
end
