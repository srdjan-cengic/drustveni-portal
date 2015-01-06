class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
    	t.integer :entry_id, null: false
    	t.integer :user_id, null: false
    	t.string :comment_text, null: false
    end
     add_index :comments, [:entry_id,:user_id]
  end
end
