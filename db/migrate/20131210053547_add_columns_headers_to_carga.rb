class AddColumnsHeadersToCarga < ActiveRecord::Migration
  def change
    add_column :cargas, :columna_uno, :string
    add_column :cargas, :columna_dos, :string
    add_column :cargas, :columna_tres, :string
  end
end
