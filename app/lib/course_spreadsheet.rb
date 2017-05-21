# Helper class for generating a college spreadsheet.
class CourseSpreadsheet
  # Generates a spreadsheet for the specified course and year.
  #
  # @param course [Course] the course to generate a spreadsheet for.
  # @param year [Fixnum] the year to use when generating the spreadsheet.
  #
  # @return [Spreadsheet]
  def self.generate(course, year)
    spreadsheet = Spreadsheet.new

    # College worksheet
    spreadsheet.add_worksheet 'Course Info'

    # Totals
    rows =[['Course', course.title],
           ['Year', "#{year} - #{year+1}"]]
    spreadsheet.add_table ['Item', 'Value'], rows, 'Info'
    spreadsheet.add_blank_row

    # Students
    rows = course.course_selections.current(year).map{|s| [s.application.full_name,
                                                           s.college_offer_text,
                                                           s.student_choice_text,
                                                           s.application.status.titleize,
                                                           s.application.submitted_date]}
    table = spreadsheet.add_table ['Student', 'Offer', 'Reply', 'Status', 'Submitted'], rows, 'Students'
    spreadsheet.add_blank_row

    # Breakdown
    spreadsheet.add_worksheet 'Breakdowns'

    # Offers
    rows = CourseSelection.report_course_offers(course.id, year)
    table = spreadsheet.add_table ['Offer', 'Applicants'], rows, 'College Offers'
    spreadsheet.add_piechart 'College Offers', table, [3, 0], [4, 13]
    spreadsheet.add_blank_row

    # Replies
    rows = CourseSelection.report_course_choices(course.id, year)
    table = spreadsheet.add_table ['Reply', 'Applicants'], rows, 'Student Replies'
    spreadsheet.add_piechart 'Student Choices', table, [8, 0], [4, 13]
    spreadsheet.add_blank_row

    # Genders
    rows = Application.report_course_genders(course.id, year)
    table = spreadsheet.add_table ['Gender', 'Applicants'], rows, 'Student Genders'
    spreadsheet.add_piechart 'Student Gender', table, [13, 0], [4, 13]
    spreadsheet.add_blank_row

    # Ages
    rows = Application.report_course_ages(course.id, year)
    table = spreadsheet.add_table ['Age', 'Applicants'], rows, 'Student Ages'
    spreadsheet.add_linechart 'Student Ages', table, [3, 14], [9, 13]
    spreadsheet.add_blank_row

    # Schools
    rows = CourseSelection.report_course_schools(course.id, year)
    table = spreadsheet.add_table ['School', 'Applicants'], rows, 'Schools'
    spreadsheet.add_barchart 'Schools', table, [13, 14], [9, 16]

    spreadsheet
  end
end