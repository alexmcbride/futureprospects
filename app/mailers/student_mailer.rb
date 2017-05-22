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

    StudentMessenger.new.course_cancelled student, course
  end

  def application_submitted(student, application)
    @student = student
    @application = application
    mail(to: @student.email, subject: 'Future Prospects - Application Submitted')

    StudentMessenger.new.application_submitted(student, self)
  end

  def application_cancelled(student, application)
    @student = student
    @application = application
    mail(to: @student.email, subject: 'Future Prospects - Application Cancelled')

    StudentMessenger.new.application_cancelled(student, application)
  end

  def application_completed(student, application)
    @student = student
    @application = application
    mail(to: @student.email, subject: 'Future Prospects - Application Completed')

    StudentMessenger.new.application_completed(student, application)
  end

  def payment_received(student, payment)
    @student = student
    @payment = payment
    mail(to: @student.email, subject: 'Future Prospects - Payment Received')

    StudentMessenger.new.payment_received(student, payment)
  end

  def payment_failed(student, payment)
    @student = student
    @payment = payment
    mail(to: @student.email, subject: 'Future Prospects - Payment Failed')

    StudentMessenger.new.payment_failed(student, payment)
  end

  def decisions_made(student, application)
    @student = student
    @application = application
    mail(to: @student.email, subject: 'Future Prospects - Decisions Made')

    StudentMessenger.new.decisions_made(student, application)
  end

  def clearance(student, courses)
    @student = student
    @courses = courses
    mail(to: student.email, subject: 'Future Prospects - Clearance')

    StudentMessenger.new.clearance(student, courses)
  end

  def clearance_application(student, course)
    @student = student
    @course = course
    mail(to: student.email, subject: 'Future Prospects - Clearance Application')

    StudentMessenger.new.clearance_application(student, course)
  end

  def reply_overdue(student, application)
    @student = student
    @application = application
    mail(to: @student.email, subject: 'Future Prospects - Application Cancelled')

    StudentMessenger.new.reply_overdue(student, application)
  end
end