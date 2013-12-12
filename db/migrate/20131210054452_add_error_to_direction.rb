class AddErrorToDirection < ActiveRecord::Migration
  def change
    add_column :directions, :error, :string
  end
end
