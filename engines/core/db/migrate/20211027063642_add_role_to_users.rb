class AddRoleToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :rw_users, :role, :integer
  end
end
