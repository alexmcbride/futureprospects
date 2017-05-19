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
                   .where(college_id: @college.id)
                   .includes(:category, :college)
                   .order(:category_id, :title)
                   .paginate(page: params[:page], per_page: 20)
  end

  # GET /staff/reports/college/:id/show
  def show_college
    authorize :report, :college?
    @college = College.find params[:id]

    respond_to do |format|
      format.html
      format.xlsx {
        p = Axlsx::Package.new do |p|
          p.workbook.add_worksheet(name: 'College') do |sheet|
            sheet.add_row [@college.name]
          end
        end

        send_data p.to_stream.read, filename: "college.xlsx",  type: "application/xlsx"
      }
    end
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
  # GET /staff/reports/courses/:id/course_genders
  def course_genders
    authorize :report, :course?
    render json: Application.current.joins(:course_selections).where('course_selections.course_id': params[:id]).group(:gender).order(:gender).count.map{|k,v|[k.humanize, v] }
  end

  # GET /staff/reports/courses/:id/course_ages
  def course_ages
    authorize :report, :course?
    render json: Application.current.joins(:course_selections).where('course_selections.course_id': 2).group('EXTRACT(YEAR FROM age(CURRENT_DATE, birth_date))').count.to_a.sort {|x, y|x[0]<=>y[0]}
  end

  # GET /staff/reports/courses/:id/course_offers
  def course_offers
    authorize :report, :course?
    render json: CourseSelection.current.course(params[:id]).group(:college_offer).order(:college_offer).count.map{|k,v| [k ? k.titleize : 'Pending',v]}.compact
  end

  # GET /staff/reports/courses/:id/course_replies
  def course_replies
    authorize :report, :course?
    render json: CourseSelection.current.course(params[:id]).group(:student_choice).order(:student_choice).count.map{|k,v| [k ? k.titleize : 'Pending',v] if k != 'skipped'}.compact
  end

  # GET /staff/reports/courses/:id/course_schools
  def course_schools
    authorize :report, :course?
    render json: CourseSelection.current.course(params[:id]).schools.group('schools.name').order('schools.name').count
  end

  # GET /staff/reports/courses/:id/course_applications_by_week
  def course_applications_by_week
    authorize :report, :course?
    render json: CourseSelection.current.course(params[:id]).joins(:application)
                     .group_by_week('applications.submitted_date').count
  end

  # GET /staff/reports/colleges/:id/course_applicants
  def college_course_applicants
    authorize :report, :college?
    render json: CourseSelection.current.college(params[:id]).group('courses.title').order('courses.title').count
  end

  def college_categories
    authorize :report, :college?
    render json: Category.joins(courses: {course_selections: :application}).where('courses.college_id': params[:id]).where('applications.created_at' => Application.current_year).group('categories.name').order('categories.name').count
  end

  # GET /staff/reports/colleges/:id/course_applicants
  def college_offers
    authorize :report, :college?
    render json: CourseSelection.current.college(params[:id]).group(:college_offer).order(:college_offer).count.map {|k, v| [ k ? k.titleize : 'Pending', v]}
  end

  # GET /staff/reports/colleges/:id/course_applicants
  def college_choices
    authorize :report, :college?
    render json: CourseSelection.current.college(params[:id]).group(:student_choice).order(:student_choice).count.map {|k, v| [ k ? k.titleize : 'Pending', v] if k != 'skipped'}.compact
  end

  # GET /staff/reports/colleges/:id/gender
  def college_genders
    authorize :report, :college?
    render json: Application.current.college(params[:id]).group(:gender).order(:gender).count
  end

  # GET /staff/reports/colleges/:id/gender
  def college_birth_dates
    authorize :report, :college?
    render json: Application.current.college(params[:id]).group('EXTRACT(YEAR FROM age(CURRENT_DATE, birth_date))').count
  end

  # GET /staff/reports/colleges/:id/gender
  def college_schools
    authorize :report, :college?
    render json: Application.current.college(params[:id]).joins(:schools).group('schools.name').order('schools.name').count
  end

  # GET /staff/reports/courses/:id/applications_by_week
  def college_applications_by_week
    authorize :report, :college?
    render json: Application.current.college(params[:id]).group_by_week('applications.created_at').count
  end
end
