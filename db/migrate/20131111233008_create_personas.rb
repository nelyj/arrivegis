class CreatePersonas < ActiveRecord::Migration
  def change
    create_table :personas do |t|
      t.string :nombre
      t.integer :edad

      t.timestamps
    end
  end
end
