class ChangeColumnNullInCategories < ActiveRecord::Migration[6.0]
  def change
    change_column_null :categories, :title, true
  end
end
