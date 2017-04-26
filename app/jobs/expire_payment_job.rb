class ExpirePaymentJob < ApplicationJob
  queue_as :default

  def self.perform(application_id)
    puts 'JOB RUNNING ----'
    app = Application.find application_id
    app.expire_payments unless app.nil?
  end
end