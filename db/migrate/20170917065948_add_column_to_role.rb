class AddColumnToRole < ActiveRecord::Migration[5.1]
  def change
    add_column :roles, :role_num, :integer
  end
end
