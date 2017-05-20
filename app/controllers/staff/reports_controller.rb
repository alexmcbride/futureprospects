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
    render json: Application.current(params[:year].to_i)
                     .college(params[:id])
                     .group('EXTRACT(YEAR FROM age(CURRENT_DATE, birth_date))')
                     .count
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
    # Generates a spreadsheet that can be downloaded.
    #
    # @return [StringIO] a stream of bytes that can be sent to the browser.
    def download_spreadsheet(college)
      raise Pundit::NotAuthorizedError unless current_staff.has_role? :can_download_reports

      # TODO: move into separate file?
      Axlsx::Package.new do |p|
        p.workbook.add_worksheet(name: 'College') do |sheet|
          # Heading
          sheet.add_row [college.name]
          sheet.add_row ['Total Students', college.count_applicants]
          sheet.add_row ['Total Applications', college.count_course_selections]
          sheet.add_row ['Successful Applications', CourseSelection.successful_current_college(college.id).count]
          sheet.add_row

          # Course table
          sheet.add_row ['Course', 'Category', 'Applicants', 'Spaces']
          count = 0
          college.courses.includes(:category).each do |course|
            sheet.add_row [course.title, course.category.name, course.current_selections_count, course.spaces]
            count += 1
          end
          sheet.add_table "A6:D#{6+count}", name: 'Courses', style_info: {name: 'TableStyleLight13'}
        end

        p.workbook.add_worksheet(name: 'Breakdown') do |sheet|
          # College offers
          sheet.add_row
          sheet.add_row ['College Offer', 'Applicants']
          CourseSelection.report_college_offers(college.id).each do |offer, count|
            sheet.add_row([offer, count])
          end
          index = sheet.rows.last.index + 1
          sheet.add_table "A2:B#{index}", name: 'College Offers', style_info: {name: 'TableStyleLight13'}

          # College offers pie chart
          sheet.add_chart(Axlsx::Pie3DChart) do |chart|
            chart.title = 'College Offers'
            chart.add_series :data => sheet["B3:B#{index}"], :labels => sheet["A3:A#{index}"]
            chart.start_at 3, 1
            chart.end_at 8, 14
          end

          # Student choices
          (15-index).times {sheet.add_row}
          sheet << ['Student Choices', 'Applicants']
          CourseSelection.report_college_choices(college.id).each do |offer, count|
            sheet << [offer, count]
          end
          index = sheet.rows.last.index + 1
          sheet.add_table "A16:B#{index}", name: 'Student Choices Offers', style_info: {name: 'TableStyleLight13'}

          # Student replies pie chart
          sheet.add_chart(Axlsx::Pie3DChart) do |chart|
            chart.title = 'Student Choices'
            chart.add_series :data => sheet["B17:B#{index}"], :labels => sheet["A17:A#{index}"]
            chart.start_at 3, 15
            chart.end_at 8, 28
          end

          # Gender
          i = 1
          row = sheet.rows[i]
          7.times {row.add_cell '      '}
          row.add_cell 'Gender'
          row.add_cell 'Applicants'
          Application.report_gender(college.id).each do |gender, count|
            i += 1
            row = sheet.rows[i]
            7.times {row.add_cell '      '}
            row.add_cell gender
            row.add_cell count
          end
          index = row.index + 1
          sheet.add_table "J2:K#{index}", name: 'Student Genders', style_info: {name: 'TableStyleLight13'}

          # Gender pie chart
          sheet.add_chart(Axlsx::Pie3DChart) do |chart|
            chart.title = 'Gender'
            chart.add_series :data => sheet["K3:K#{index}"], :labels => sheet["J3:J#{index}"]
            chart.start_at 12, 1
            chart.end_at 17, 14
          end

          # Student ages
          # sheet.add_chart(Axlsx::Line3DChart, :title => "Simple 3D Line Chart", :rotX => 30, :rotY => 20) do |chart|
          #   chart.start_at 0, 5
          #   chart.end_at 10, 20
          #   chart.add_series :data => sheet["A3:A6"], :title => sheet["A2"], :color => "0000FF"
          #   chart.add_series :data => sheet["B3:B6"], :title => sheet["B2"], :color => "FF0000"
          #   chart.catAxis.title = 'X Axis'
          #   chart.valAxis.title = 'Y Axis'
          # end
        end
      end.to_stream.read
    end
end
