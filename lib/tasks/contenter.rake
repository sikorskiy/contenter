namespace :contenter do
  desc "Weekly_Track"
  task weeks: :environment do
    track()
  end
end
