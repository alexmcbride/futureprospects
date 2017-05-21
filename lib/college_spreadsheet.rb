# Helper class for generating a college spreadsheet.
class CollegeSpreadsheet
  # Generates a spreadsheet for the specified college and year.
  #
  # @param college [College] the college to generate a spreadsheet for.
  # @param year [Fixnum] the year to use when generating the spreadsheet.
  #
  # @return [Spreadsheet]
  def self.generate(college, year)
    spreadsheet = Spreadsheet.new

    # College worksheet
    spreadsheet.add_worksheet 'College'

    # Totals
    rows =[['College', college.name],
           ['Year', "#{year} - #{year+1}"],
           ['Total Students', college.count_applicants(year)],
           ['Total Applications', college.count_course_selections(year)],
           ['Successful Applications', CourseSelection.report_current_college(college.id, year).count]]
    spreadsheet.add_table ['Item', 'Value'], rows
    spreadsheet.add_blank_row

    # Courses
    counts = get_course_counts college.id, year
    rows = Course.select('DISTINCT courses.*').includes(:category).current(year).college(college.id).map {|c| [c.title, c.category.name, counts[c.id], c.spaces]}
    spreadsheet.add_table ['Course', 'Category', 'Applicants', 'Spaces'], rows, 'Courses'

    # Breakdown worksheet
    spreadsheet.add_worksheet 'Breakdown'

    # College offers
    rows = CourseSelection.report_college_offers(college.id, year).map {|offer, count|[offer, count]}
    table = spreadsheet.add_table ['College Offer', 'Applicants'], rows, 'College Offers'
    spreadsheet.add_piechart 'College Offers', table, [3, 0], [4, 13]
    spreadsheet.add_blank_row

    # Student choices
    rows = CourseSelection.report_college_choices(college.id, year).map { |offer, count| [offer, count]}
    table = spreadsheet.add_table ['Student Choices', 'Applicants'], rows, 'Student Choices Offers'
    spreadsheet.add_piechart 'Student Choices', table, [8, 0], [4, 13]
    spreadsheet.add_blank_row

    # Gender
    rows = Application.report_gender(college.id, year).map { |gender, count| [gender.humanize, count]}
    table = spreadsheet.add_table ['Gender', 'Applicants'], rows, 'Student Gender'
    spreadsheet.add_piechart 'Student Gender', table, [13, 0], [4, 13]
    spreadsheet.add_blank_row

    # Ages
    rows = Application.report_ages(college.id, year).to_a
    table = spreadsheet.add_table ['Age', 'Applicants'], rows, 'Student Age'
    spreadsheet.add_linechart 'Student Ages', table, [3, 14], [9, 13]
    spreadsheet.add_blank_row

    # Schools
    rows =  Application.report_schools(college.id, year).to_a
    table = spreadsheet.add_table ['School', 'Applicants'], rows, 'Schools'
    spreadsheet.add_barchart 'Schools', table, [13, 14], [9, 16]

    spreadsheet
  end

  # Gets course counts for the specified college and year
  #
  # @param college_id [Fixnum]
  # @param year [Fixnum]
  #
  # @return [Hash]
  def self.get_course_counts(college_id, year)
    counts = {}
    CourseSelection.report_courses(college_id, year).each do |attributes, count|
      title, id = attributes
      counts[id] = count
    end
    counts
  end
end