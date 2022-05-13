# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#users = User.create!([
#                       { email: 'aaa@example.org' },
#                       { email: 'bbb@example.org' },
#                     ])

categories = Category.create!([
                                { title: 'Programming language' },
                                { title: 'Psychological' },
                                { title: 'Humorous' }
                              ])

user = User.first

tests = Test.create!([
                       { title: 'Ruby',
                         level: 2,
                         category: categories[0],
                         author: user },
                       { title: 'Java',
                         level: 3,
                         category: categories[0],
                         author: user },
                       { title: 'Extroversion',
                         category: categories[1],
                         author: user },
                       { title: 'Historic',
                         category: categories[2],
                         author: user }
                     ])

questions = Question.create!([
                               { body: 'How command show ruby version?', test: tests[0] },
                               { body: 'What is Local Variable?', test: tests[1] },
                               { body: 'You introvert?', test: tests[2] },
                               { body: 'What happened in 1965 year?', test: tests[3] }
                             ])

answers_for_first_test = Answer.create!([
                                          { body: 'ruby -v', correct: true, question: questions[0] },
                                          { body: 'ruby -b', question: questions[0] },
                                          { body: 'ruby -d', question: questions[0] },
                                          { body: 'ruby -s', question: questions[0] }
                                        ])

answers_for_second_test = Answer.create!([
                                           { body: 'Global variable', question: questions[1] },
                                           { body: 'Instans variable', question: questions[1] },
                                           { body: 'Local variable', correct: true, question: questions[1] },
                                           { body: 'Class variable', question: questions[1] }
                                         ])

answers_for_third_test = Answer.create!([
                                          { body: 'Yes', question: questions[2] },
                                          { body: 'May be', question: questions[2] },
                                          { body: 'Probably not', question: questions[2] },
                                          { body: 'Not', correct: true, question: questions[2] }
                                        ])

answers_for_fourth = Answer.create!([
                                      { body: 'Yea', question: questions[3] },
                                      { body: '1964 year', correct: true, question: questions[3] },
                                      { body: 'Groundhog day', question: questions[3] },
                                      { body: 'Hot air balloon flight under water', question: questions[3] }
                                    ])

TestPassage.create!([
                 { correct_questions: 1,
                   in_progress: true,
                   user: user,
                   test: tests[0],
                   current_question: questions[0] },
                 { passed: true,
                   user: user,
                   test: tests[3],
                   current_question: questions[3] },
                 { correct_questions: 1,
                   passed: true,
                   user: user,
                   test: tests[1],
                   current_question: questions[1] },
               ])
