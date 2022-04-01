class ChangeColumnNullInTests < ActiveRecord::Migration[6.0]
  def change
    change_column_null :tests, :title, true
    change_column_null :tests, :level, true
    change_column_null :tests, :category_id, true
  end
end
