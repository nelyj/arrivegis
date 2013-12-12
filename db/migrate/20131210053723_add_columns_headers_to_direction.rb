class AddColumnsHeadersToDirection < ActiveRecord::Migration
  def change
    add_column :directions, :columna_uno, :string
    add_column :directions, :columna_dos, :string
    add_column :directions, :columna_tres, :string
  end
end
