class Store < ActiveRecord::Base
  has_many :sub_domains, dependent: :destroy
  has_many :user_stores, dependent: :destroy
  belongs_to :address, dependent: :destroy
  has_one :about, dependent: :destroy
  has_many :users, through: :user_stores  
  has_many :store_logos, dependent: :destroy
  accepts_nested_attributes_for  :address, allow_destroy: true
  accepts_nested_attributes_for  :about, allow_destroy: true
  accepts_nested_attributes_for  :sub_domains, allow_destroy: true
  accepts_nested_attributes_for  :user_stores, allow_destroy: true

  validates :name, presence: true

  mount_uploader :icon, StoreIconUploader
end
