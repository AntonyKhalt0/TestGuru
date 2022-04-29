class CreateTestPassages < ActiveRecord::Migration[6.0]
  def change
    create_table :test_passages do |t|
      t.integer :number_quetions, null: false
      t.integer :number_correct_answers, null: false, default: 0
      t.boolean :in_progress, null: false, default: false
      t.boolean :passed, null: false, default: false
      t.references :user, foreign_key: true, null: false
      t.references :test, foreign_key: true, null: false

      t.timestamps
    end
  end
end
