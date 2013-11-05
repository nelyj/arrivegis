class AddFileToCarga < ActiveRecord::Migration
  def change
    add_column :cargas, :file_name, :string
  end
end
