class User < ApplicationRecord
  has_many :created_tests, class_name: "Test", foreign_key: "author_id", dependent: :destroy
  has_many :results, dependent: :delete_all
  has_many :tests, through: :results
  
  def test_history_with_level(level)
    tests.where(level: level)
  end
end
