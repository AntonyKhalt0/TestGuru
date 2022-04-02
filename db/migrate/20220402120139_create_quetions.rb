class CreateQuetions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.string :body, null: false
      t.references :test, foreign_key: { to_table: :tests }, null: false

      t.timestamps
    end
  end
end
