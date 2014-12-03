class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :status, limit: 1, default: 'P'
      t.integer :user_id, null: false
      t.integer :category_id, null: false
      t.timestamps
    end
    add_index :entries, [:user_id, :category_id]
  end
end
