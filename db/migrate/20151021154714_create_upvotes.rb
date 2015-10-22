class CreateUpvotes < ActiveRecord::Migration
  def change
    create_table :upvotes do |t|
      t.integer :question_id
      t.integer :user_id, null: false
      t.integer :answer_id
      t.integer :comment_id

      t.timestamps null: false
    end
  end
end
