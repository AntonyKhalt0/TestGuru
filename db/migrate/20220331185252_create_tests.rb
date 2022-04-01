class CreateTests < ActiveRecord::Migration[6.0]
  def change
    create_table :tests do |t|
      t.string :title
      t.integer :level
      t.integer :category_id
      add_foreign_key :tests, :categories

      t.timestamps
    end
  end
end
