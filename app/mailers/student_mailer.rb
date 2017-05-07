# Class to represent student emails.
class StudentMailer < ApplicationMailer
  # Make application helpers available to mailers
  add_template_helper(ApplicationHelper)

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

  def application_cancelled(student, application)
    @student = student
    @application = application
    mail(to: @student.email, subject: 'Future Prospects - Application Cancelled')
  end

  def application_completed(student, application)
    @student = student
    @application = application
    mail(to: @student.email, subject: 'Future Prospects - Application Completed')
  end

  def payment_received(student, payment)
    @student = student
    @payment = payment
    mail(to: @student.email, subject: 'Future Prospects - Payment Received')
  end

  def payment_failed(student, payment)
    @student = student
    @payment = payment
    mail(to: @student.email, subject: 'Future Prospects - Payment Failed')
  end

  def decisions_made(student, application)
    @student = student
    @application = application
    mail(to: @student.email, subject: 'Future Prospects - Decisions Made')
  end
end