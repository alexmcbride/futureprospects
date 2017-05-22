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

    StudentMessenger.course_cancelled student, course
  end

  def application_submitted(student, application)
    @student = student
    @application = application
    mail(to: @student.email, subject: 'Future Prospects - Application Submitted')

    StudentMessenger.application_submitted(student, application)
  end

  def application_cancelled(student, application)
    @student = student
    @application = application
    mail(to: @student.email, subject: 'Future Prospects - Application Cancelled')

    StudentMessenger.application_cancelled(student, application)
  end

  def application_completed(student, application)
    @student = student
    @application = application
    mail(to: @student.email, subject: 'Future Prospects - Application Completed')

    StudentMessenger.application_completed(student, application)
  end

  def payment_received(student, payment)
    @student = student
    @payment = payment
    mail(to: @student.email, subject: 'Future Prospects - Payment Received')

    StudentMessenger.payment_received(student, payment)
  end

  def payment_failed(student, payment)
    @student = student
    @payment = payment
    mail(to: @student.email, subject: 'Future Prospects - Payment Failed')

    StudentMessenger.payment_failed(student, payment)
  end

  def decisions_made(student, application)
    @student = student
    @application = application
    mail(to: @student.email, subject: 'Future Prospects - Decisions Made')

    StudentMessenger.decisions_made(student, application)
  end

  def clearance(student, courses)
    @student = student
    @courses = courses
    mail(to: student.email, subject: 'Future Prospects - Clearance')

    StudentMessenger.clearance(student, courses)
  end

  def clearance_application(student, course)
    @student = student
    @course = course
    mail(to: student.email, subject: 'Future Prospects - Clearance Application')

    StudentMessenger.clearance_application(student, course)
  end

  def reply_overdue(student, application)
    @student = student
    @application = application
    mail(to: @student.email, subject: 'Future Prospects - Application Cancelled')

    StudentMessenger.reply_overdue(student, application)
  end
end