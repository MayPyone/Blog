class AddRoledefaultToUsers < ActiveRecord::Migration[7.1]
  def up
    change_column_default :users, :role, 'default'
  end

  def down
    change_column_default :users, :role, nil
  end
end
