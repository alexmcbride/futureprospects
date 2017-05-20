# Class to handle viewing and downloading college and course reports.
class Staff::ReportsController < Staff::StaffController
  # GET /staff/reports
  #
  # Shows list of colleges.
  def index
    authorize :report, :colleges?
    @colleges = policy_scope College
  end

  # GET /staff/reports/college/:id
  #
  # Shows list of courses at a college.
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
  #
  # Shows report for college. If format of :xlsx is used then downloads report as Excel spreadsheet file.
  def show_college
    authorize :report, :college?
    @college = College.find params[:id]
    authorize @college

    respond_to do |format|
      format.html {
        @years = policy_scope(Application).years.count
        @year = params[:year] ? params[:year].to_i : @years.first[0].year
      }
      format.xlsx { send_data download_spreadsheet(@college), filename: 'college.xlsx',  type: 'application/xlsx' }
    end
  end

  # GET /staff/reports/course/:id
  #
  # Shows report for course.
  def course
    authorize :report, :course?
    @course = Course.find params[:id]
    authorize @course

    respond_to do |format|
      format.html {
        @years = CourseSelection.years(@course.id).count
        @year = params[:year] ? params[:year].to_i : @years.first[0].year
      }
    end
  end

  # GET /staff/reports/courses/:id/course_genders.json
  #
  # Provides course genders JSON for background loading of charts.
  def course_genders
    authorize :report, :course?
    render json: Application.current(params[:year].to_i)
                     .joins(:course_selections)
                     .where('course_selections.course_id': params[:id])
                     .group(:gender)
                     .order(:gender)
                     .count
                     .map{|k,v|[k.humanize, v] }
  end

  # GET /staff/reports/courses/:id/course_ages.json
  #
  # Provides course ages JSON for background loading of charts.
  def course_ages
    authorize :report, :course?
    render json: Application.current(params[:year].to_i)
                     .joins(:course_selections)
                     .where('course_selections.course_id': 2)
                     .group('EXTRACT(YEAR FROM age(CURRENT_DATE, birth_date))')
                     .count
                     .to_a
                     .sort {|x, y|x[0]<=>y[0]}
  end

  # GET /staff/reports/courses/:id/course_offers.json
  #
  # Provides course offers JSON for background loading of charts.
  def course_offers
    authorize :report, :course?
    render json: CourseSelection.current(params[:year].to_i)
                     .course(params[:id])
                     .group(:college_offer)
                     .order(:college_offer)
                     .count
                     .map{|k,v| [k ? k.titleize : 'Pending',v]}
                     .compact
  end

  # GET /staff/reports/courses/:id/course_replies.json
  #
  # Provides course replies JSON for background loading of charts.
  def course_replies
    authorize :report, :course?
    render json: CourseSelection.current(params[:year].to_i)
                     .course(params[:id])
                     .group(:student_choice)
                     .order(:student_choice)
                     .count
                     .map{|k,v| [k ? k.titleize : 'Pending',v] if k != 'skipped'}
                     .compact
  end

  # GET /staff/reports/courses/:id/course_schools.json
  #
  # Provides course schools JSON for background loading of charts.
  def course_schools
    authorize :report, :course?
    render json: CourseSelection.current(params[:year].to_i)
                     .course(params[:id])
                     .schools
                     .group('schools.name')
                     .order('schools.name')
                     .count
  end

  # GET /staff/reports/courses/:id/course_applications_by_week.json
  #
  # Provides course applications JSON for background loading of charts.
  def course_applications_by_week
    authorize :report, :course?
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
    authorize :report, :college?
    render json: CourseSelection.current(params[:year].to_i)
                     .college(params[:id])
                     .group('courses.title')
                     .order('courses.title').count
  end

  # GET /staff/reports/colleges/:id/college_categories.json
  #
  # Provides college categories JSON for background loading of charts.
  def college_categories
    authorize :report, :college?
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
    authorize :report, :college?
    render json: CourseSelection.report_college_offers(params[:id], params[:year].to_i)
  end

  # GET /staff/reports/colleges/:id/course_applicants.json
  #
  # Provides college choices JSON for background loading of charts.
  def college_choices
    authorize :report, :college?
    render json: CourseSelection.report_college_choices(params[:id], params[:year].to_i)
  end

  # GET /staff/reports/colleges/:id/gender.json
  #
  # Provides college genders JSON for background loading of charts.
  def college_genders
    authorize :report, :college?
    render json: Application.report_gender(params[:id], params[:year].to_i)
  end

  # GET /staff/reports/colleges/:id/gender.json
  #
  # Provides college ages JSON for background loading of charts.
  def college_birth_dates
    authorize :report, :college?
    render json: Application.report_ages(params[:id], params[:year].to_i)
  end

  # GET /staff/reports/colleges/:id/gender.json
  #
  # Provides college schools JSON for background loading of charts.
  def college_schools
    authorize :report, :college?
    render json: Application.current(params[:year].to_i)
                     .college(params[:id])
                     .joins(:schools)
                     .group('schools.name')
                     .order('schools.name')
                     .count
  end

  # GET /staff/reports/courses/:id/applications_by_week.json
  #
  # Provides college applications by week JSON for background loading of charts.
  def college_applications_by_week
    authorize :report, :college?
    render json: Application.current(params[:year].to_i)
                     .college(params[:id])
                     .group_by_week('applications.created_at')
                     .count
  end

  private
    def add_table(sheet, header=[], rows=[], name='Default')
      tmp = [sheet.add_row(header)]

      rows.each do |row|
        tmp << sheet.add_row(row)
      end

      table_ref = "#{tmp.first.cells.first.reference}:#{tmp.last.cells.last.reference}".tr('$', '')
      sheet.add_table table_ref, name: name, style_info: {name: 'TableStyleLight13'}

      tmp
    end

    def get_reference(cell)
      cell.reference.tr('$', '')
    end

    def add_blank_row(sheet)
      sheet.add_row
      sheet.rows.last.index + 2
    end

    def add_piechart(sheet, title, table, start=[3, 0], size=[5, 14])
      # get left column
      labels = "#{get_reference(table.second.cells.first)}:#{get_reference(table.last.cells.first)}"
      data = "#{get_reference(table.second.cells.second)}:#{get_reference(table.last.cells.last)}"

      sheet.add_chart(Axlsx::Pie3DChart) do |chart|
        chart.title = title
        chart.add_series :data => sheet[data], :labels => sheet[labels]
        chart.start_at start[0], start[1]
        chart.end_at start[0]+size[0], start[1]+size[1]
      end
    end

    # Generates a spreadsheet that can be downloaded.
    #
    # @return [StringIO] a stream of bytes that can be sent to the browser.
    def download_spreadsheet(college)
      raise Pundit::NotAuthorizedError unless current_staff.has_role? :can_download_reports

      # TODO: move into separate file?
      Axlsx::Package.new do |p|
        p.workbook.add_worksheet(name: 'College') do |sheet|
          rows =[['College', college.name],
                 ['Total Students', college.count_applicants],
                 ['Total Applications', college.count_course_selections],
                 ['Successful Applications', CourseSelection.successful_current_college(college.id).count]]
          add_table sheet, ['Item', 'Value'], rows

          add_blank_row sheet
          rows = college.courses
                     .includes(:category)
                     .map {|c| [c.title, c.category.name, c.current_selections_count, c.spaces]}
          add_table sheet, ['Course', 'Category', 'Applicants', 'Spaces'], rows, 'Courses'
        end

        p.workbook.add_worksheet(name: 'Breakdown') do |sheet|
          # College offers
          rows = CourseSelection.report_college_offers(college.id).map {|offer, count|[offer, count]}
          table = add_table sheet, ['College Offer', 'Applicants'], rows, 'College Offers'
          add_piechart sheet, 'College Offers', table, [3, 0], [4, 13]

          # Student choices
          add_blank_row sheet
          rows = CourseSelection.report_college_choices(college.id).map { |offer, count| [offer, count]}
          table = add_table sheet, ['Student Choices', 'Applicants'], rows, 'Student Choices Offers'
          add_piechart sheet, 'Student Choices', table, [8, 0], [4, 13]

          # Gender
          add_blank_row sheet
          rows = Application.report_gender(college.id).map { |gender, count| [gender, count]}
          table = add_table sheet, ['Gender', 'Applicants'], rows, 'Student Gender'
          add_piechart sheet, 'Student Gender', table, [13, 0], [4, 13]
        end
      end.to_stream.read
    end
end
