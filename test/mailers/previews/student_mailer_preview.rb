class StudentMailerPreview < ActionMailer::Preview
  def course_cancelled
    application =  Application.current.first
    course = application.course_selections.first.course
    StudentMailer.course_cancelled(application.student, course)
  end

  # Previews application_submitted email
  def application_submitted
    application = Application.current.where.not(status: :submitting).first
    student = application.student
    StudentMailer.application_submitted(student, application)
  end

  # Previews application cancelled mail
  def application_cancelled
    application = Application.where(status: :cancelled).first
    StudentMailer.application_cancelled(application.student, application)
  end

  # Previews application completed mail
  def application_completed
    application = Application.find 33
    StudentMailer.application_completed(application.student, application)
  end

  # Previews payment_received email
  def payment_received
    application = Application.current.where(status: :awaiting_decisions).first
    payment = application.payments.first
    StudentMailer.payment_received(application.student, payment)
  end

  def payment_failed
    application = Application.where(status: :payment_failed).first
    StudentMailer.payment_failed(application.student, application.unpaid_payment)
  end

  def decisions_made
    application = Application.find 33
    StudentMailer.decisions_made(application.student, application)
  end

  def clearance
    application = Application.find 13
    courses = Course.clearance_courses application
    StudentMailer.clearance(application.student, courses)
  end

  def clearance_application
    application = Application.find 13
    course = application.course_selections.last.course
    StudentMailer.clearance_application(application.student, course)
  end

  def reply_overdue
    @application = Application.find 26
    StudentMailer.reply_overdue(@application.student, @application)
  end

  def oauth_registration
    student = Student.all.first
    student.provider = 'Facebook'
    StudentMailer.oauth_registration student
  end
end