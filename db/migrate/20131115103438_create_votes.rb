class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :count, default: 0
      t.integer :storage_id, null: false, unique: true
      t.timestamps
    end
    add_index :votes, [:storage_id]
  end
end
