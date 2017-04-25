# Class to represent student emails.
class StudentMailer < ApplicationMailer
  # Sends the specified student a course cancelled email.
  #
  # * +student+ - the student to sent the email to.
  # * +course+ - the course that's been cancelled.
  def course_cancelled(student, course)
    @student = student
    @course = course
    mail(to: @student.email, subject: 'Future Prospects - Course Cancelled')
  end

  def application_submitted(student, application)
    @student = student
    @application = application
    mail(to: @student.email, subject: 'Future Prospects - Application Submitted')
  end

  def payment_received(student, payment)
    @student = student
    @payment = payment
    mail(to: @student.email, subject: 'Future Prospects - Payment Received')
  end
end