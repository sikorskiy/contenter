# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#

Status.first.update_attributes(number: 1, whole_length: 10)
Status.find(Status.first.next_status_id).update_attributes(number: 1, whole_length: 20)

Iteration.find_or_create_by(text: 'Не было проверки администратором')
Iteration.find_or_create_by(text: 'Первая итерация исправлений')
Iteration.find_or_create_by(text: 'Вторая итерация исправлений')
Iteration.find_or_create_by(text: 'Третья и более итерация исправлений')
Iteration.find_or_create_by(text: 'Принято без исправлений')
Iteration.find_or_create_by(text: 'Другое')

RatingChangeType.find_or_create_by(name: 'Завершение работы с лагерем') { |r| r.change = 1 }
RatingChangeType.find_or_create_by(name: 'Ура! Новый статус!') { |r| r.change = 0 }
RatingChangeType.find_or_create_by(name: 'Лагерь зачтен администратором с первой попытки') { |r| r.change = 3 }
RatingChangeType.find_or_create_by(name: 'Лагерь зачтен администратором с 1-ой итерации правок') { |r| r.change = 2 }
RatingChangeType.find_or_create_by(name: 'Лагерь зачтен администратором со 2-ой и более итерации правок') { |r| r.change = 1 }
RatingChangeType.find_or_create_by(name: 'Лагерь отправлен на доработку 1-ый раз') { |r| r.change = -1 }
RatingChangeType.find_or_create_by(name: 'Лагерь отправлен на доработку 2-ой раз') { |r| r.change = -3 }
RatingChangeType.find_or_create_by(name: 'Лагерь отправлен на доработку 3-ий и более раз') { |r| r.change = -10 }
RatingChangeType.find_or_create_by(name: 'Лагерь не был исправлен 2 недели') { |r| r.change = -5 }
RatingChangeType.find_or_create_by(name: 'Критично низкое количество заполненных лагерей за неделю') { |r| r.change = -30 }
RatingChangeType.find_or_create_by(name: 'Недостаточное количество заполненных лагерей за неделю') { |r| r.change = -15 }
RatingChangeType.find_or_create_by(name: 'Высокое количество заполненных лагерей за неделю') { |r| r.change = 10 }
RatingChangeType.find_or_create_by(name: 'Выдающееся количество заполненных лагерей за неделю') { |r| r.change = 25 }

