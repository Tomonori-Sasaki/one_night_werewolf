class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :image
      t.integer :voted
      t.integer :citizen_win
      t.integer :wolf_win
      t.integer :total_win
      t.integer :role_id
      t.integer :user_id

      t.timestamps
    end
  end
end
