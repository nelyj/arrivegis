class AddUserIdToCargas < ActiveRecord::Migration
  def change
    add_column :cargas, :user_id, :integer
    add_index :cargas, :user_id
  end
end
