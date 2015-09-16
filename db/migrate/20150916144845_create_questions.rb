class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.integer :user_id, null: false
      t.integer :upvotes

      t.timestamps null: false
    end
    add_index :questions, :title, unique: true
    add_index :questions, :user_id
  end
end
