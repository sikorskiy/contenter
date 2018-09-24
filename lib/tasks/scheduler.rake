desc "Save week results"
task :save_week_results => :environment do
  puts "Save results of the #{Date.today.to_s}"
  Camp.find_each {|c| WeekResult.create(camp: c, user: c.user, is_approved: c.is_approved, is_finished: c.is_finished, day: (Date.today.day-1))}
  puts "done."
end

task :update_column => :environment do
  WeekResult.find_each do |wr|
    wr.day = Date.today - 1
    wr.save
  end
  puts "done."
end