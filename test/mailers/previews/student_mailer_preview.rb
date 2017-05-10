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
    student = Student.find 2
    application = student.applications.first
    StudentMailer.decisions_made(student, application)
  end

  def clearance
    course = Course.where('course_selections_count>0').first
    student = course.course_selections.first.application.student
    StudentMailer.clearance(student, [course])
  end
end