class StudentMailerPreview < ActionMailer::Preview
  # Previews application_submitted email
  def application_submitted
    student = Student.find 2
    application = student.current_application
    StudentMailer.application_submitted(student, application)
  end

  # Previews payment_received email
  def payment_received
    student = Student.find 2
    payment = Payment.new payment_type: :credit_card, amount: 2000, status: :authorized, last_four_digits: '0000'
    StudentMailer.payment_received(student, payment)
  end
end