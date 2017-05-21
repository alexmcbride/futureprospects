# Class to handle viewing and downloading college and course reports. Report permissions are governed by +ReportPolicy+,
# but also the college's or course's normal policy. Both policies and taken into account to determine whether a report
# can be viewed or downloaded. Many of the methods in this controller are used for background downloading JSON by the
# charts.
class Staff::ReportsController < Staff::StaffController
  # GET /staff/reports
  #
  # Shows list of colleges.
  def index
    authorize :report, :view?
    @colleges = policy_scope College
  end

  # GET /staff/reports/college/:id
  #
  # Shows list of courses at a college.
  def college
    authorize :report, :view?
    @college = College.find params[:id]
    @courses = policy_scope(Course)
                   .where(college_id: @college.id)
                   .includes(:category, :college)
                   .order(:category_id, :title)
                   .paginate(page: params[:page], per_page: 20)
  end

  # GET /staff/reports/college/:id/show
  #
  # Shows an HTML report for a college, or if format :xlsx is passed downloads report as spreadsheet file.
  def show_college
    @college = College.find params[:id]
    authorize @college

    # For year switching stuff.
    @years = policy_scope(Application).years.count
    @year = params[:year] ? params[:year].to_i : @years.first[0].year

    respond_to do |format|
      # View the HTML version of the report.
      format.html { authorize :report, :view? }

      # Download the report as a Spreadsheet.
      format.xlsx do
        authorize :report, :download?
        send_data @college.to_spreadsheet(@year).get_data, filename: 'College Report.xlsx',  type: 'application/xlsx'
      end
    end
  end

  # GET /staff/reports/course/:id
  #
  # Shows an HTML report for a course, or if format :xlsx is passed downloads report as spreadsheet file.
  def show_course
    @course = Course.find params[:id]
    authorize @course

    # For year switching stuff.
    @years = CourseSelection.years(@course.id).count
    @year = params[:year] ? params[:year].to_i : @years.first[0].year # Default

    respond_to do |format|
      # View the HTML version of the report.
      format.html { authorize :report, :view? }

      # Download the report as a spreadsheet.
      format.xlsx do
        authorize :report, :download?
        spreadsheet = @course.to_spreadsheet(@year)
        send_data spreadsheet.get_data, filename: 'Course Report.xlsx',  type: 'application/xlsx'
      end
    end
  end

  # GET /staff/reports/courses/:id/course_genders.json
  #
  # Provides course genders JSON for background loading of charts.
  def course_genders
    authorize :report, :view?
    render json: Application.report_course_genders(params[:id], params[:year].to_i)
  end

  # GET /staff/reports/courses/:id/course_ages.json
  #
  # Provides course ages JSON for background loading of charts.
  def course_ages
    authorize :report, :view?
    render json: Application.report_course_ages(params[:id], params[:year].to_i)
  end

  # GET /staff/reports/courses/:id/course_offers.json
  #
  # Provides course offers JSON for background loading of charts.
  def course_offers
    authorize :report, :view?
    render json: CourseSelection.report_course_offers(params[:id], params[:year].to_i)
  end

  # GET /staff/reports/courses/:id/course_replies.json
  #
  # Provides course replies JSON for background loading of charts.
  def course_replies
    authorize :report, :view?
    render json: CourseSelection.report_course_choices(params[:id], params[:year].to_i)
  end

  # GET /staff/reports/courses/:id/course_schools.json
  #
  # Provides course schools JSON for background loading of charts.
  def course_schools
    authorize :report, :view?
    render json: CourseSelection.report_course_schools(params[:id], params[:year].to_i)
  end

  # GET /staff/reports/courses/:id/course_applications_by_week.json
  #
  # Provides course applications JSON for background loading of charts.
  def course_applications_by_week
    authorize :report, :view?
    render json: CourseSelection.current(params[:year].to_i)
                     .course(params[:id])
                     .joins(:application)
                     .group_by_week('applications.submitted_date')
                     .count
  end

  # GET /staff/reports/colleges/:id/course_applicants.json
  #
  # Provides college courses JSON for background loading of charts.
  def college_course_applicants
    authorize :report, :view?
    render json: CourseSelection.report_courses(params[:id], params[:year].to_i).map {|k,v| [k[0], v]}
  end

  # GET /staff/reports/colleges/:id/college_categories.json
  #
  # Provides college categories JSON for background loading of charts.
  def college_categories
    authorize :report, :view?
    render json: Category.joins(courses: {course_selections: :application})
                     .where('courses.college_id': params[:id])
                     .where('applications.created_at' => Application.current_year(params[:year].to_i))
                     .group('categories.name')
                     .order('categories.name')
                     .count
  end

  # GET /staff/reports/colleges/:id/course_applicants.json
  #
  # Provides college offers JSON for background loading of charts.
  def college_offers
    authorize :report, :view?
    render json: CourseSelection.report_college_offers(params[:id], params[:year].to_i)
  end

  # GET /staff/reports/colleges/:id/course_applicants.json
  #
  # Provides college choices JSON for background loading of charts.
  def college_choices
    authorize :report, :view?
    render json: CourseSelection.report_college_choices(params[:id], params[:year].to_i)
  end

  # GET /staff/reports/colleges/:id/gender.json
  #
  # Provides college genders JSON for background loading of charts.
  def college_genders
    authorize :report, :view?
    render json: Application.report_gender(params[:id], params[:year].to_i)
  end

  # GET /staff/reports/colleges/:id/ages.json
  #
  # Provides college ages JSON for background loading of charts.
  def college_ages
    authorize :report, :view?
    render json: Application.report_ages(params[:id], params[:year].to_i)
  end

  # GET /staff/reports/colleges/:id/schools.json
  #
  # Provides college schools JSON for background loading of charts.
  def college_schools
    authorize :report, :view?
    render json: Application.report_schools(params[:id], params[:year].to_i)
  end

  # GET /staff/reports/courses/:id/applications_by_week.json
  #
  # Provides college applications by week JSON for background loading of charts.
  def college_applications_by_week
    authorize :report, :view?
    render json: Application.current(params[:year].to_i)
                     .college(params[:id])
                     .group_by_week('applications.created_at')
                     .count
  end
end
