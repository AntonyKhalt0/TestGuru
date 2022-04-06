class User < ApplicationRecord
  def test_history_with_level(level)
    Test.joins("INNER JOIN results ON results.test_id = tests.id", "INNER JOIN users ON results.user_id = users.id")
        .where(level: level)
        .where(users: { id: id })
  end
end
