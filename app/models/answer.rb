class Answer < ApplicationRecord
  MAX_COUNT_ANSWERS = 4

  belongs_to :question

  validates :body, presence: true
  validate :validate_number_answers, on: :create

  scope :correct, -> { where(correct: true) }

  private

  def validate_number_answers
    if question.answers.count >= MAX_COUNT_ANSWERS
      errors.add(:question,
                  message: 'The number of responses does not correspond to reality')
    end
  end
end
