# Abstract class that all mailers inherit from.
class ApplicationMailer < ActionMailer::Base
  default from: 'futureprospectsapp@gmail.com'
  layout 'mailer'
end
