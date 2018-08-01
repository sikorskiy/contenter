# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#

%w[Зима(?) Лето(?) Весна(?) Осень(?) Зима Лето Весна Осень].each do |name|
  CampCategory.find_or_create_by(name: name)
end

%w[Православный Мусульманский Математический Футбольный].each do |name|
  CampCategory.find_or_create_by(name: name)
end

%w[Родитель Мама Школьник Бабушка Дедушка Папа].each do |name|
  ReviewRole.find_or_create_by(name: name)
end
