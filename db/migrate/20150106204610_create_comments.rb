class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
    	t.integer :entrie_id, null: false
    	t.integer :user_id, null: false
    	t.string :comment_text, null: false
    end
     add_index :comments, [:entrie_id,:user_id]
  end
end
