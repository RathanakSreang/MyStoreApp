class Image < ActiveRecord::Base
  #has_one :user

  mount_uploader :name, ImageUploader
end
