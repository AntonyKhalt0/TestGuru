# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do |n|
  name = "Example User #{n+1}"
  email = "example-#{n+1}@railstutorial.org"
  User.create!(name: name, email: email)
end

Category.create!(title: "Programming language")
Category.create!(title: "Psychological")
Category.create!(title: "Humorous")

Test.create!(title: "Ruby", 
        level: 2, 
        category_id: 1,
        author_id: 2)
Test.create!(title: "Java", 
        level: 3, 
        category_id: 1,
        author_id: 2)
Test.create!(title: "Extroversion", 
        category_id: 2,
        author_id: 4)
Test.create!(title: "Historic", 
        category_id: 3,
        author_id: 5)

Question.create!(body: "Какая команда позволяет найти установленную версию Ruby?", test_id: 1)
Question.create!(body: "Что такое Local Variable?", test_id: 2)
Question.create!(body: "Вы интроверт?", test_id: 3)
Question.create!(body: "Что закончилось в 1965 году?", test_id: 4)

Answer.create!(body: "ruby -v", correct: true, question_id: 1)
Answer.create!(body: "ruby -b", question_id: 1)
Answer.create!(body: "ruby -d", question_id: 1)
Answer.create!(body: "ruby -s", question_id: 1)

Answer.create!(body: "Глобальная переменная", question_id: 2)
Answer.create!(body: "Инстанс переменная", question_id: 2)
Answer.create!(body: "Локальная переменная", correct: true, question_id: 2)
Answer.create!(body: "Переменная класса", question_id: 2)

Answer.create!(body: "Да", question_id: 3)
Answer.create!(body: "Может быть", question_id: 3)
Answer.create!(body: "Скорее нет", question_id: 3)
Answer.create!(body: "Нет", correct: true, question_id: 3)

Answer.create!(body: "Да", question_id: 4)
Answer.create!(body: "1964 год", correct: true, question_id: 4)
Answer.create!(body: "День сурка", question_id: 4)
Answer.create!(body: "Полет на воздушном шаре под водой", question_id: 4)

Result.create!(number_quetions: 1, 
        number_correct_answers: 1,
        in_progress: true, 
        user_id: 1,
        test_id: 1)
Result.create!(number_quetions: 1,
        passed: true, 
        user_id: 3,
        test_id: 4)
Result.create!(number_quetions: 1, 
        number_correct_answers: 1,
        passed: true, 
        user_id: 1,
        test_id: 2)
Result.create!(number_quetions: 1,
        in_progress: true, 
        user_id: 6,
        test_id: 3)
Result.create!(number_quetions: 1,
        passed: true,
        user_id: 7,
        test_id: 1)
