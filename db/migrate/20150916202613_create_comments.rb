class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body, null: false
      t.integer :upvotes
      t.integer :question_id
      t.integer :answer_id
      t.integer :user_id, null: false

      t.timestamps null: false
    end
    add_index :comments, :question_id
    add_index :comments, :answer_id
  end
end
