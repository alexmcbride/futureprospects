# Helper class for sending SMS text messages.
class StudentMessenger
  include ActionView::Helpers::NumberHelper

  def course_cancelled(student, course)
    student.send_text_message "Future Prospects - the course '#{course.title}' has been cancelled, please sign in to " +
                                  'find out more: http://futureprospects.herokuapp.com.'
  end

  def application_submitted(student, application)
    application.send_text_message 'Future Prospects - Thank you for submitting your application. However, we need to receive ' +
                                      "a payment for the application fee of #{number_to_currency application.calculate_fee_pounds, unit: '£'}. " +
                                      'Sign in to make a payment: http://futureprospects.herokuapp.com.'
  end

  def application_cancelled(student, application)
    application.send_text_message 'Future Prospects - your application has been cancelled due to a failure to pay the '+
                                      "application fee of #{number_to_currency application.calculate_fee_pounds, unit: '£'}. "+
                                      'Please sign in to find out more: http://futureprospects.herokuapp.com.'
  end

  def application_completed(student, application)
    application.send_text_message 'Future Prospects - your application is now complete! You will hear from your chosen ' +
                                      'colleges in time. For more info sign in to: http://futureprospects.herokuapp.com.'
  end

  def payment_received(student, payment)
    student.send_text_message 'Future Prospects - we have received your payment. Next your application will be sent to ' +
                                  'your chosen colleges to be considered. To track your application please sign in: ' +
                                  'http://futureprospects.herokuapp.com.'
  end

  def payment_failed(student, payment)
    student.send_text_message 'Future Prospects - your payment has failed. We need to receive a payment for your ' +
                                  "application by #{payment.application.payment_expiry_time} or your application will " +
                                  'be cancelled. Please visit: http://futureprospects.herokuapp.com.'
  end

  def decisions_made(student, application)
    application.send_text_message 'Future Prospects - all of your decisions have been made. Please sign in to make your ' +
                                      'own choices: http://futureprospects.herokuapp.com.'
  end

  def clearance(student, courses)
    student.send_text_message "Future Prospects - we're sorry your application was unsuccessful but you now " +
                                      'qualify for clearance courses. To view currently available courses please sign ' +
                                      'in: http://futureprospects.herokuapp.com.'
  end

  def clearance_application(student, course)
    student.send_text_message 'Future Prospects - thank you for applying for a clearance course. Your application ' +
                                      'will be sent to the selected college to be considered. To track your application ' +
                                      'please sign in: http://futureprospects.herokuapp.com.'
  end

  def reply_overdue(student, application)
    application.send_text_message 'Future Prospects - your application has been cancelled due to not receiving your ' +
                                      'replies in time. For more information please sign in: http://futureprospects.herokuapp.com.'
  end
end