class Direction < ActiveRecord::Base
  attr_accessible :address, :carga_id, :latitude, :longitude
  belongs_to :carga
end
