# This task is called periodically, it cancels any applications with failed payments This is called either manually
# when in development mode, or every 24 hours in heroku's scheduler.
namespace :site_tasks do
  desc 'Cancels applications that have outstanding payments over 7 days old'
  task :handle_failed_payments => :environment do
    puts 'Task: handle failed payments task started'
    Application.handle_failed_payments
    puts 'Task end: failed payments'
  end

  desc 'Cancels applications that have not received timely replies'
  task :handle_overdue_replies => :environment do
    puts 'Task: handle overdue replies task started'
    Application.handle_overdue_replies
    puts 'Task end: overdue replies'
  end
end
