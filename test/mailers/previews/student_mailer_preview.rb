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

  # Previews payment_received email
  def payment_received
    student = Student.find 2
    payment = student.applications.first.payments.first
    StudentMailer.payment_received(student, payment)
  end

  def payment_failed
    student = Student.find 2
    payment = student.applications.first.payments.first
    StudentMailer.payment_failed(student, payment)
  end

  # Previews payment_received email
  def application_cancelled
    student = Student.find 2
    payment = student.applications.first.payments.first
    StudentMailer.application_cancelled(student, payment)
  end
end