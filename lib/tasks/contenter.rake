namespace :contenter do
  desc "Weekly_Track"
  task weeks: :environment do
    tracks()
  end
end
