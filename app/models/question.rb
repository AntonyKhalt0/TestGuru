# frozen_string_literal: true

class Question < ApplicationRecord
  MIN_ANSWERS = 1
  MAX_ANSWERS = 4

  belongs_to :test

  has_many :answers, dependent: :destroy

  validates :body, presence: true
  validate :validate_number_answers

  private

  def validate_number_answers
    if (MIN_ANSWERS..MAX_ANSWERS).exclude? answers.length
      errors.add(:answers,
                 message: 'the number of responses does not correspond to reality')
    end
  end
end
