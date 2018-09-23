desc "Save week results"
task :save_week_results => :environment do
  puts "Save results of the #{Date.today.to_s}"
  Camp.find_each {|c| WeekResult.create(camp: c, user: c.user, is_approved: c.is_approved, is_finished: c.is_finished, week_start: (Date.today-6).to_s)}
  puts "done."
end