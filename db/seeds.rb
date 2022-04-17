# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create!([
                       { name: Faker::Name.name, email: 'example_1@example.org' },
                       { name: Faker::Name.name, email: 'example_2@example.org' },
                       { name: Faker::Name.name, email: 'example_3@example.org' },
                       { name: Faker::Name.name, email: 'example_4@example.org' },
                       { name: Faker::Name.name, email: 'example_5@example.org' }
                     ])

categories = Category.create!([
                                { title: 'Programming language' },
                                { title: 'Psychological' },
                                { title: 'Humorous' }
                              ])

tests = Test.create!([
                       { title: 'Ruby',
                         level: 2,
                         category: categories[0],
                         author: users[1] },
                       { title: 'Java',
                         level: 3,
                         category: categories[0],
                         author: users[1] },
                       { title: 'Extroversion',
                         category: categories[1],
                         author: users[3] },
                       { title: 'Historic',
                         category: categories[2],
                         author: users[4] }
                     ])

questions = Question.create!([
                               { body: 'Какая команда позволяет найти установленную версию Ruby?', test: tests[0] },
                               { body: 'Что такое Local Variable?', test: tests[1] },
                               { body: 'Вы интроверт?', test: tests[2] },
                               { body: 'Что закончилось в 1965 году?', test: tests[3] }
                             ])

answers_for_first_test = Answer.create!([
                                          { body: 'ruby -v', correct: true, question: questions[0] },
                                          { body: 'ruby -b', question: questions[0] },
                                          { body: 'ruby -d', question: questions[0] },
                                          { body: 'ruby -s', question: questions[0] }
                                        ])

answers_for_second_test = Answer.create!([
                                           { body: 'Глобальная переменная', question: questions[1] },
                                           { body: 'Инстанс переменная', question: questions[1] },
                                           { body: 'Локальная переменная', correct: true, question: questions[1] },
                                           { body: 'Переменная класса', question: questions[1] }
                                         ])

answers_for_third_test = Answer.create!([
                                          { body: 'Да', question: questions[2] },
                                          { body: 'Может быть', question: questions[2] },
                                          { body: 'Скорее нет', question: questions[2] },
                                          { body: 'Нет', correct: true, question: questions[2] }
                                        ])

answers_for_fourth = Answer.create!([
                                      { body: 'Да', question: questions[3] },
                                      { body: '1964 год', correct: true, question: questions[3] },
                                      { body: 'День сурка', question: questions[3] },
                                      { body: 'Полет на воздушном шаре под водой', question: questions[3] }
                                    ])

Result.create!([
                 { number_quetions: 1,
                   number_correct_answers: 1,
                   in_progress: true,
                   user: users[0],
                   test: tests[0] },
                 { number_quetions: 1,
                   passed: true,
                   user: users[2],
                   test: tests[3] },
                 { number_quetions: 1,
                   number_correct_answers: 1,
                   passed: true,
                   user: users[1],
                   test: tests[1] },
                 { number_quetions: 1,
                   in_progress: true,
                   user: users[3],
                   test: tests[2] },
                 { number_quetions: 1,
                   passed: true,
                   user: users[4],
                   test: tests[0] }
               ])
