class User < ApplicationRecord
  has_many :tests
  has_many :results
  has_many :tests, through: :results
  
  def test_history_with_level(level)
    Test.joins("INNER JOIN results ON results.test_id = tests.id", "INNER JOIN users ON results.user_id = users.id")
        .where(level: level)
        .where(users: { id: id })
  end
end
