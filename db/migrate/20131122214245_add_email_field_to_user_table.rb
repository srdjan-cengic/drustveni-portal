class AddEmailFieldToUserTable < ActiveRecord::Migration
  def change
  	add_column :users, :email, :string, limit: 100
  end
end
