class Carga < ActiveRecord::Base
  after_create :setting_name

  attr_accessible :name, :file_name

  belongs_to :user
  has_many :directions

  mount_uploader :file_name, FileUploader

  def setting_name
    self.name = Time.now.year.to_s + Time.now.month.to_s + Time.now.day.to_s + Time.now.min.to_s + Time.now.sec.to_s
  end
end
