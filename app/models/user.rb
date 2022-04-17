# frozen_string_literal: true

class User < ApplicationRecord
  has_many :created_tests, class_name: 'Test', foreign_key: 'author_id', dependent: :destroy
  has_many :results, dependent: :delete_all
  has_many :tests, through: :results

  validates :name, :email, presence: true

  def test_history_by_complexity(complexity)
    tests.public_send(complexity) if %w[simple intermediate difficult].include? complexity
  end
end
