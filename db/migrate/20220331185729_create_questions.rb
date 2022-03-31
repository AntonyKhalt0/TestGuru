class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.integer :id
      t.string :body
      t.integer :tests_id

      t.timestamps
    end
  end
end
