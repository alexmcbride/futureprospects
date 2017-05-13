class StudentMailerPreview < ActionMailer::Preview
  def course_cancelled
    student = Student.find 2
    course = student.applications.first.course_selections.first.course
    StudentMailer.course_cancelled(student, course)
  end

  # Previews application_submitted email
  def application_submitted
    student = Student.find 2
    application = student.current_application
    StudentMailer.application_submitted(student, application)
  end

  # Previews application cancelled mail
  def application_cancelled
    application = Application.where(status: :cancelled).first
    StudentMailer.application_cancelled(application.student, application)
  end

  # Previews application completed mail
  def application_completed
    application = Application.where(status: :completed).first
    StudentMailer.application_completed(application.student, application)
  end

  # Previews payment_received email
  def payment_received
    student = Student.find 2
    payment = student.applications.first.payments.first
    StudentMailer.payment_received(student, payment)
  end

  def payment_failed
    application = Application.where(status: :payment_failed).first
    StudentMailer.payment_failed(application.student, application.unpaid_payment)
  end

  def decisions_made
    application = Application.where(status: :awaiting_replies).first
    StudentMailer.decisions_made(application.student, application)
  end

  def clearance
    application = Application.where(status: :clearance).first
    courses = Course.clearance_courses application
    StudentMailer.clearance(application.student, courses)
  end

  def clearance_application
    application = Application.where(status: :all_rejected).first
    course = application.course_selections.first.course
    StudentMailer.clearance_application(application.student, course)
  end

  def reply_overdue
    @application = CourseSelection.find_overdue_applications.first
    StudentMailer.reply_overdue(@application.student, @application)
  end
end