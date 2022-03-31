class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.integer :id
      t.string :body
      t.boolean :correct
      t.integer :questions_id

      t.timestamps
    end
  end
end
