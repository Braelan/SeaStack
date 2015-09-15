class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.integer :reputation
      t.string :password_digest, null: false
      t.string :session_token, null: false
      t.string :status

      t.timestamps null: false
    end
  end
end
