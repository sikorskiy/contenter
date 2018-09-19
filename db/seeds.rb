# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#

Status.create(badge: Badge.first, length: 10, pay_coefficient: 1)
Status.create(badge: Badge.find_by(name: 'Hedgehog'), length: 10, pay_coefficient: 1.02, prev_status_id: Status.first.id)


User.all.each do |u|
  u.status = Status.first
  u.save
end