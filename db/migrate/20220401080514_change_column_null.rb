class ChangeColumnNull < ActiveRecord::Migration[6.0]
  def change
    change_column_null :answers, :body, true
    change_column_null :users, :name, true
  end
end
