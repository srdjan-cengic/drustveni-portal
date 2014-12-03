class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, limit: 25, null: false
      t.string :password_hash, null: false
      t.string :password_salt, null: false
      t.integer :user_role_id, null: false
      t.timestamps
    end
    add_index :users, [:user_role_id]
  end
end
