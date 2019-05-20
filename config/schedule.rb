# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever


# every 1.day, at: '4:30 am' do

# Times are adjusted +7 hours for UTC:  6pm, 4am, 11am, 2pm


# This assumes teh RAILS_ENV environment variable has already been set.
every 1.day, at: ['11:00 am'] do
  rake "db:backup"
end

every :day do
  # Get rid of Nomad DB dumps that are older tha one week.
  command "/usr/bin/find /home/deployer/apps/pugetive/shared/log/ -mtime +7 -name '*backup*.sql' -delete"
  command "/usr/bin/find /home/deployer/apps/pugetive/shared/log/ -mtime +7 -name '*backup*.gz' -delete"
end

every 1.day, :at => '5:00 am' do
  rake "-s sitemap:refresh"
end

every 1.day, at: ['10:00 am'] do
  command "cd /home/deployer/apps/pugetive/current;ruby ./lib/africa/africa_reminder_mail.rb"
end
