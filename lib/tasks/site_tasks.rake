# This task is called periodically, it cancels any applications with failed payments This is called either manually
# when in development mode, or every 24 hours in heroku's scheduler.
namespace :site_tasks do
  desc 'Processes daily tasks.'
  task :handle_daily_tasks => :environment do
    puts 'Task: process failed payments task started'
    Application.process_failed_payments
    puts 'Task end: failed payments'

    puts 'Task: process overdue replies task started'
    Application.process_overdue_replies
    puts 'Task end: overdue replies'
  end
end
