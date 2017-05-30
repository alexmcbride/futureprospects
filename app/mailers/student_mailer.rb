# Class to represent student emails.
class StudentMailer < ApplicationMailer
  # Make application helpers available to mailers
  add_template_helper(ApplicationHelper)

  # Sends the specified student a course cancelled email.
  #
  # @param student [Student]
  # @param course [Course]
  def course_cancelled(student, course)
    @student = student
    @course = course
    mail(to: @student.email, subject: 'Future Prospects - Course Cancelled')
  end

  # Sends the application submitted email.
  #
  # @param student [Student]
  # @param application [Application]
  def application_submitted(student, application)
    @student = student
    @application = application
    mail(to: @student.email, subject: 'Future Prospects - Application Submitted')
  end

  # Sends the application cancelled email.
  #
  # @param student [Student]
  # @param application [Application]
  def application_cancelled(student, application)
    @student = student
    @application = application
    mail(to: @student.email, subject: 'Future Prospects - Application Cancelled')
  end

  # Sends the application completed email.
  #
  # @param student [Student]
  # @param application [Application]
  def application_completed(student, application)
    @student = student
    @application = application
    mail(to: @student.email, subject: 'Future Prospects - Application Completed')
  end

  # Sends the payment received email.
  #
  # @param student [Student]
  # @param payment [Payment]
  def payment_received(student, payment)
    @student = student
    @payment = payment
    mail(to: @student.email, subject: 'Future Prospects - Payment Received')
  end

  # Sends the payment failed email.
  #
  # @param student [Student]
  # @param payment [Payment]
  def payment_failed(student, payment)
    @student = student
    @payment = payment
    mail(to: @student.email, subject: 'Future Prospects - Payment Failed')
  end

  # Sends the decisions made email.
  #
  # @param student [Student]
  # @param application [Application]
  def decisions_made(student, application)
    @student = student
    @application = application
    mail(to: @student.email, subject: 'Future Prospects - Decisions Made')
  end

  # Sends the clearance email.
  #
  # @param student [Student]
  # @param courses [Array<Course>]
  def clearance(student, courses)
    @student = student
    @courses = courses
    mail(to: student.email, subject: 'Future Prospects - Clearance')
  end

  # Sends the clearance application received email.
  #
  # @param student [Student]
  # @param course [Course]
  def clearance_application(student, course)
    @student = student
    @course = course
    mail(to: student.email, subject: 'Future Prospects - Clearance Application')
  end

  # Sends the reply overdue email.
  #
  # @param student [Student]
  # @param application [Application]
  def reply_overdue(student, application)
    @student = student
    @application = application
    mail(to: @student.email, subject: 'Future Prospects - Application Cancelled')
  end

  # Sends the open-authentication registration email.
  #
  # @param student [Student]
  def oauth_registration(student)
    @student = student
    mail(to: @student.email, subject: 'Future Prospects - Account Created')
  end
end