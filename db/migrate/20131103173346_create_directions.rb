class CreateDirections < ActiveRecord::Migration
  def change
    create_table :directions do |t|
      t.string :address
      t.float :latitude
      t.float :longitude
      t.integer :carga_id

      t.timestamps
    end

    add_index :directions, :carga_id
  end
end
