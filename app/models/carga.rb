class Carga < ActiveRecord::Base
  before_create :setting_name

  attr_accessible :name, :file_name

  belongs_to :user
  has_many :directions

  mount_uploader :file_name, FileUploader

  def setting_name
    self.name = Time.now.strftime("%Y%m%d%H%M%S").to_s + "_" + "#{File.basename(self.file_name.to_s, File.extname(self.file_name.to_s))}"
  end
end
