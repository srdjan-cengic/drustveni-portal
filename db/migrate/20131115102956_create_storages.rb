class CreateStorages < ActiveRecord::Migration
  def change
    create_table :storages do |t|
      t.string :title, limit: 80, null: false
      t.text :content, null: false
      t.integer :entry_id, null: false, unique: true
      t.timestamps
    end
    add_index :storages, [:entry_id]
  end
end
