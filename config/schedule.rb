# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron
ENV['RAILS_ENV'] = "development"
# Example:
#
 set :output, "/log/every.log"
#
 every 1.weeks, :at => '12:00 am' do
  rake "contenter: weeks"
end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
