class Carga < ActiveRecord::Base
  attr_accessible :name

  belongs_to :user
  has_many :directions
end
