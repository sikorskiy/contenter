desc "Save week results"
task :save_week_results => :environment do
  puts "Save results of the #{Date.today.to_s}"
  Camp.find_each {|c| WeekResult.create(camp: c, user: c.user, is_approved: c.is_approved, is_finished: c.is_finished, day: Date.yesterday)}
  puts "done."
end

task :update_rating => :environment do
  is_finished = RatingChangeType.find_by_name('Завершение работы с лагерем')
  User.all.find_each do |u|
    WeekResult.where(user: u, day: Date.yesterday).find_each do |wr|
      if wr.is_finished
        unless RatingChange.find_by(camp_id: wr.camp_id, rating_change_type: is_finished)
          RatingChange.create(user: u, rating_change_type: is_finished, camp_id: wr.camp_id)
          if u.rating + is_finished.change > u.status.whole_length
            u.status = Status.find_by(number: u.status.number + 1)
            puts("Rating for user #{u.name} upgraded")
          end
          if u.rating + is_finished.change <= u.status.whole_length - u.status.length && u.status.number > 1
            u.status = Status.find_by(number: u.status.number - 1)
            puts("Rating for user #{u.name} downsized")
          end
          u.rating += is_finished.change
          u.save
          puts("Rating for camp #{wr.camp.name} finishing changed")
        end
      end
    end
  end
  puts "done."
end