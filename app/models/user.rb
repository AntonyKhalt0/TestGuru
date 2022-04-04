class User < ApplicationRecord
  def test_history_with_level(level)
    user_id = self.id
    results = Result.where(user_id: user_id)
    tests_id = []
    results.each { |result| tests_id.push(result.test_id) }
    tests = Test.where(id: tests_id, level: level)
  end
end
