class AddColumnsToRole < ActiveRecord::Migration[5.1]
  def change
    add_column :roles, :image, :string
    add_column :roles, :team, :integer
  end
end
