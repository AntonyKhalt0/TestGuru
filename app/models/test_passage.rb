# frozen_string_literal: true

class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', foreign_key: 'question_id', optional: true

  THRESHOLD_PASSAGE = 85

  before_validation :before_validation_set_question

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end

    save!
  end

  def number_of_question
    test.questions.index(current_question).next 
  end

  def result_percent
    (correct_questions.to_f / test.questions.count) * 100
  end

  def successful?
    result_percent >= THRESHOLD_PASSAGE
  end

  private

  def before_validation_set_question
    self.current_question = next_question    
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.to_a.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    if self.current_question.nil? && test.present?
      test.questions.first
    else
      test.questions.order(:id).where('id > ?', current_question.id).first
    end
  end
end
