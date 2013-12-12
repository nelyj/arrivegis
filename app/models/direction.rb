class Direction < ActiveRecord::Base
  attr_accessible :address, :carga_id, :latitude, :longitude, :columna_uno, :columna_dos, :columna_tres, :error
  belongs_to :carga
end

