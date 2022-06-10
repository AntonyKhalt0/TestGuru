class CreateBadges < ActiveRecord::Migration[6.0]
  def change
    create_table :badges do |t|
      t.string :name, null: false
      t.string :img_url, null: false
      t.string :rule, null: false
      t.integer :rule_options
      
      t.references :author, foreign_key: { to_table: :users }, null: false
      
      t.timestamps
    end
    add_index :badges, :name, unique: true
  end
end
