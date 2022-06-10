# frozen_string_literal: true

class BadgesService
  AVAILABLE_RULES = [
    :all_tests_passages_rule,
    :all_correct_answers_rule,
    :test_first_passage_rule,
    :all_tests_passage_from_category_rule
  ]

  def initialize(test_passage)
    @test_passage = test_passage
    @user = @test_passage.user
    @test = @test_passage.test
  end

  #Вызов добавления бэйджа
  def call
    #Вернуть badges, где условия подходят.
    assigned_badges = []
    AVAILABLE_RULES.each { |rule| assigned_badges.push(awarding(rule)) }
    assigned_badges
  end

  private

  def awarding(rule)
    send(rule)
  end

  #Правило на все тесты
  def all_tests_passages_rule
    badge = Badge.find_by(rule: 'all_tests_passages_rule')
    test_passages_ids = TestPassage.where(user_id: @user.id).pluck(:test_id).uniq 
    tests_ids = Test.pluck(:id).sort 
    badge if test_passages_ids == tests_ids
  end

  #Правило на все правильные ответы (1 раз)
  def all_correct_answers_rule
    badge = Badge.find_by(rule: 'all_correct_answers_rule')
    correct_answers = @test_passage.correct_questions == @test.questions.count
    existence_of_users_badge = @user.badges.include?(badge)
    badge if correct_answers && !existence_of_users_badge
  end

  #Правило на первое прохождение теста
  def test_first_passage_rule
    badge = Badge.find_by(rule: 'test_first_passage_rule')
    test_passage = TestPassage.where(user: @user, test: @test)
    badge if test_passage.count == 1
  end

  #Правило для прохождения всех тестов определенной категории
  def all_tests_passage_from_category_rule
    badge = Badge.find_by(rule: 'all_tests_passage_from_category_rule', rule_options: @test.category_id) 
    tests_ids = Test.where(category_id: @test.category_id).pluck(:id).sort
    test_passages_ids = TestPassage.where(user_id: @user.id, test_id: tests_ids).pluck(:test_id).uniq 
    badge if tests_ids == test_passages_ids
  end
end
