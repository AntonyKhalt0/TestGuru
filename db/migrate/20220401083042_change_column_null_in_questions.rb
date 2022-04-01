class ChangeColumnNullInQuestions < ActiveRecord::Migration[6.0]
  def change
    change_column_null :questions, :body, true
    change_column_null :questions, :test_id, true
  end
end
