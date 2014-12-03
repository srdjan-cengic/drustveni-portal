class CreateUserRoles < ActiveRecord::Migration
  def change
    create_table :user_roles do |t|
      t.string :role_name, limit: 20, null: false
      t.timestamps
    end
  end
end
