# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable

  has_many :created_tests, class_name: 'Test', foreign_key: 'author_id', dependent: :destroy
  has_many :test_passages, dependent: :delete_all
  has_many :tests, through: :test_passages
  has_many :gists, dependent: :destroy

  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  def test_history_by_complexity(complexity)
    tests.public_send(complexity) if %w[simple intermediate difficult].include? complexity
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
