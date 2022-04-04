class CreateResults < ActiveRecord::Migration[6.0]
  def change
    create_table :results do |t|
      t.integer :number_quetions, null: false
      t.integer :number_correct_answers
      t.boolean :in_progress, null: false
      t.boolean :passed, null: false
      t.references :user, foreign_key: true, null: false
      t.references :test, foreign_key: true, null: false

      t.timestamps
    end
  end
end




