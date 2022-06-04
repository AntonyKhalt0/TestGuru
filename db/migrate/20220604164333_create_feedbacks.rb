class CreateFeedbacks < ActiveRecord::Migration[6.0]
  def change
    create_table :feedbacks do |t|
      t.string :author, null: false
      t.text :body, null: false

      t.timestamps
    end
  end
end
