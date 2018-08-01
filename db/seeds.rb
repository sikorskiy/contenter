# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#

%w[Зима(?) Лето(?) Весна(?) Осень(?) Зима Лето Весна Осень].each do |name|
  SeasonType.find_or_create_by(name: name)
end

%w[Английский Немецкий Французский Хоккейный Конный Теннисный Православный
  Баскетбольный Плавание Фитнес Танцевальный Волейбольный Балетный Фигурное\ катание
  Художественная\ гимнастика Для\ похудения Физико-математический Компьютерный
  Робототехнический Бизнес Шахматный Программирование Еврейский Кадетский Патриотический
  Театральный Художественный Музыкальный
  Киберспортивный	Научный	Профориентационный	Биологический	Исторический
  Медицинский	Физический	Химический	Архитектурный	Логопедический	Психологический
  Пионерский	Тематический	Профильный	Палаточный	Для\ трудных	Для\ инвалидов
  Экологический	Туристический	Международный	Волонтерский	Семейный	Городской
  Выходного\ дня	Для\ девочек	Для\ мальчиков
  Мусульманский Математический Футбольный].each do |name|
  CampCategory.find_or_create_by(name: name)
end

%w[Родитель Мама Школьник Бабушка Дедушка Папа].each do |name|
  ReviewRole.find_or_create_by(name: name)
end


%w[admin user].each do |name|
  UserRole.find_or_create_by(name: name)
end

%w[Сочи Анапа Краснодарский\ край].each do |name|
  Geotag.find_or_create_by(name: name)
end