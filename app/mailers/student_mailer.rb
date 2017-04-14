class StudentMailer < ApplicationMailer
  def course_cancelled(student, course)
    @student = student
    @course = course
    mail(to: @student.email, subject: 'Future Prospects - Course Cancelled')
  end
end