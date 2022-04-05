# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create!([
  { name: Faker::Name.name, email: "example_1@example.org" },
  { name: Faker::Name.name, email: "example_2@example.org" }, 
  { name: Faker::Name.name, email: "example_3@example.org" },
  { name: Faker::Name.name, email: "example_4@example.org" },
  { name: Faker::Name.name, email: "example_5@example.org" }
])

categories = Category.create!([
  { title: "Programming language" },
  { title: "Psychological" },
  { title: "Humorous"}
])

tests = Test.create!([
  { title: "Ruby", 
    level: 2, 
    category_id: categories[0].id,
    author_id: users[1].id },
  { title: "Java", 
    level: 3, 
    category_id: categories[0].id,
    author_id: users[1].id },
  { title: "Extroversion", 
    category_id: categories[1].id,
    author_id: users[3].id },
  { title: "Historic", 
    category_id: categories[2].id,
    author_id: users[4].id }
])

questions = Question.create!([ 
  { body: "Какая команда позволяет найти установленную версию Ruby?", test_id: tests[0].id },
  { body: "Что такое Local Variable?", test_id: tests[1].id },
  { body: "Вы интроверт?", test_id: tests[2].id },
  { body: "Что закончилось в 1965 году?", test_id: tests[3].id }
])

answers_for_first_test = Answer.create!([ 
  { body: "ruby -v", correct: true, question_id: questions[0].id },
  { body: "ruby -b", question_id: questions[0].id },
  { body: "ruby -d", question_id: questions[0].id },
  { body: "ruby -s", question_id: questions[0].id }
])

answers_for_second_test = Answer.create!([ 
  { body: "Глобальная переменная", question_id: questions[1].id },
  { body: "Инстанс переменная", question_id: questions[1].id },
  { body: "Локальная переменная", correct: true, question_id: questions[1].id },
  { body: "Переменная класса", question_id: questions[1].id } 
])

answers_for_third_test = Answer.create!([ 
  { body: "Да", question_id: questions[2].id },
  { body: "Может быть", question_id: questions[2].id },
  { body: "Скорее нет", question_id: questions[2].id },
  { body: "Нет", correct: true, question_id: questions[2].id }
])

answers_for_fourth = Answer.create!([ 
  { body: "Да", question_id: questions[3].id },
  { body: "1964 год", correct: true, question_id: questions[3].id },
  { body: "День сурка", question_id: questions[3].id },
  { body: "Полет на воздушном шаре под водой", question_id: questions[3].id }
])

Result.create!([ 
  { number_quetions: 1, 
    number_correct_answers: 1,
    in_progress: true, 
    user_id: users[0].id,
    test_id: tests[0].id },
  { number_quetions: 1,
    passed: true, 
    user_id: users[2].id,
    test_id: tests[3].id },
  { number_quetions: 1, 
    number_correct_answers: 1,
    passed: true, 
    user_id: users[1].id,
    test_id: tests[1].id },
  { number_quetions: 1,
    in_progress: true, 
    user_id: users[3].id,
    test_id: tests[2].id },
  { number_quetions: 1,
    passed: true,
    user_id: users[4].id,
    test_id: tests[0].id }
])
