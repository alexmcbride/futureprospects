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
    student = Student.find 2
    application = student.current_application
    StudentMailer.application_cancelled(student, application)
  end

  # Previews application completed mail
  def application_completed
    application = Application.find 13
    student = application.student
    StudentMailer.application_completed(student, application)
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
    student = Student.find 2
    application = student.applications.first
    StudentMailer.decisions_made(student, application)
  end
end