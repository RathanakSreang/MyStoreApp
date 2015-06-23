class StoreLogo < ActiveRecord::Base
  belongs_to :store

  validates :title, :description, :logo, presence: true

  mount_uploader :logo, LogoUploader
end
