class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.string :body
      t.boolean :correct
      t.integer :question_id
      add_foreign_key :answers, :questions
      
      t.timestamps
    end
  end
end
