desc "Save week results"
task :save_week_results => :environment do
  puts "Save results of the #{Date.today.to_s}"
  Camp.find_each {|c| WeekResult.create(camp: c, user: c.user, is_approved: c.is_approved, is_finished: c.is_finished, day: Date.today)}
  puts "done."
end

task :update_rating => :environment do
  user_hash = {} #one day rating changing
  finish_type_rating = RatingChangeType.find_by_name('Завершение работы с лагерем')
  approved_camps_ids = RatingChangeType.where(name: ['Лагерь зачтен администратором с первой попытки', 'Лагерь зачтен администратором с 1-ой итерации правок', 'Лагерь зачтен администратором со 2-ой и более итерации правок']).ids.to_a
  Camp.find_each do |c|
    finished_camp = WeekResult.find_by(camp: c, is_finished: 1) #rating change if camp is finished
    if finished_camp
      unless RatingChange.find_by(camp_id: finished_camp.id, rating_change_type: finish_type_rating) || user_hash[c.user.id]
        RatingChange.create(user: c.user, rating_change_type: finish_type_rating, camp_id: c.id, comment: "Rating for camp '#{c.name}' finishing changed")
        if c.user.rating + finish_type_rating.change > c.user.status.whole_length
          user_hash[c.user.id] = 1
          initial_status_name = c.user.status.badge.name
          c.user.status = Status.find_by(number: c.user.status.number + 1)
          updated_status_name = c.user.status.badge.name
          RatingChange.create(user: c.user, rating_change_type: RatingChangeType.find_by_name('Ура! Новый статус!'), comment: "Status change: #{initial_status_name} -> #{updated_status_name}. Congrats!")
          puts("Rating for user #{c.user.name} upgraded")
        end
        c.user.rating += finish_type_rating.change
        c.user.save
        puts("Rating for camp #{c.name} finishing changed")
      end
    end

    approved_camp = WeekResult.find_by(camp: c, is_approved: 1) #rating change if camp is approved
    if approved_camp
      unless RatingChange.find_by(camp_id: approved_camp.id, rating_change_type_id: approved_camps_ids) || user_hash[c.user.id]
        case c.iteration.text
        when 'Первая итерация исправлений'
          approved_type_rating = RatingChangeType.find_by_name('Лагерь зачтен администратором с 1-ой итерации правок')
        when 'Вторая итерация исправлений', 'Третья и более итерация исправлений'
          approved_type_rating = RatingChangeType.find_by_name('Лагерь зачтен администратором со 2-ой и более итерации правок')
        when 'Принято без исправлений'
          approved_type_rating = RatingChangeType.find_by_name('Лагерь зачтен администратором с первой попытки')
        else
          approved_type_rating = RatingChangeType.find_by_name('Лагерь зачтен администратором со 2-ой и более итерации правок')
        end
        RatingChange.create(user: c.user, rating_change_type: approved_type_rating, camp_id: c.id, comment: "Rating for camp '#{c.name}' approving changed")
        if c.user.rating + approved_type_rating.change > c.user.status.whole_length
          user_hash[c.user.id] = 1
          initial_status_name = c.user.status.badge.name
          c.user.status = Status.find_by(number: c.user.status.number + 1)
          updated_status_name = c.user.status.badge.name
          RatingChange.create(user: c.user, rating_change_type: RatingChangeType.find_by_name('Ура! Новый статус!'), comment: "Status change: #{initial_status_name} -> #{updated_status_name}. Congrats!")
          puts("Rating for user #{c.user.name} upgraded")
        end
        c.user.rating += approved_type_rating.change
        c.user.save
        puts("Rating for camp #{c.name} approving changed")
      end
    end

  end

  puts "done."
end

task :rebuild_rating => :environment do

  Camp.find_each do |c|
    finish_type_rating = RatingChangeType.find_by_name('Завершение работы с лагерем')
    if (c.is_rated_for_finishing.nil? || c.is_rated_for_finishing == false) && (c.is_finished)
      RatingChange.create(user: c.user, rating_change_type: finish_type_rating, camp_id: c.id, comment: "Rating for camp '#{c.name}' finishing changed")
      if c.user.rating + finish_type_rating.change > c.user.status.whole_length
        initial_status_name = c.user.status.badge.name
        c.user.status = Status.find_by(number: c.user.status.number + 1)
        updated_status_name = c.user.status.badge.name
        RatingChange.create(user: c.user, rating_change_type: RatingChangeType.find_by_name('Ура! Новый статус!'), comment: "Status change: #{initial_status_name} -> #{updated_status_name}. Congrats!")
        puts("Rating for user #{c.user.name} upgraded")
      end
      c.user.rating += finish_type_rating.change
      c.user.save
      c.update_attribute(:is_rated_for_finishing, 1)
      puts("Rating for camp #{c.name} finishing changed")
    end

    if (c.is_rated_for_approving.nil? || c.is_rated_for_approving == false) && (c.is_approved)
      c.pay_coefficient = c.user.status.pay_coefficient
      case c.iteration.text
      when 'Первая итерация исправлений'
        approved_type_rating = RatingChangeType.find_by_name('Лагерь зачтен администратором с 1-ой итерации правок')
      when 'Вторая итерация исправлений', 'Третья и более итерация исправлений'
        approved_type_rating = RatingChangeType.find_by_name('Лагерь зачтен администратором со 2-ой и более итерации правок')
      when 'Принято без исправлений'
        approved_type_rating = RatingChangeType.find_by_name('Лагерь зачтен администратором с первой попытки')
      else
        approved_type_rating = RatingChangeType.find_by_name('Лагерь зачтен администратором со 2-ой и более итерации правок')
      end
      RatingChange.create(user: c.user, rating_change_type: approved_type_rating, camp_id: c.id, comment: "Rating for camp '#{c.name}' approving changed")
      if c.user.rating + approved_type_rating.change > c.user.status.whole_length
        initial_status_name = c.user.status.badge.name
        c.user.status = Status.find_by(number: c.user.status.number + 1)
        updated_status_name = c.user.status.badge.name
        RatingChange.create(user: c.user, rating_change_type: RatingChangeType.find_by_name('Ура! Новый статус!'), comment: "Status change: #{initial_status_name} -> #{updated_status_name}. Congrats!")
        puts("Rating for user #{c.user.name} upgraded")
      end
      c.user.rating += approved_type_rating.change
      c.user.save
      c.is_rated_for_approving = 1
      c.save
      puts("Rating for camp #{c.name} approving changed")
    end
  end
end