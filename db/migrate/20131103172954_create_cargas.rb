class CreateCargas < ActiveRecord::Migration
  def change
    create_table :cargas do |t|
      t.string :name

      t.timestamps
    end
  end
end
