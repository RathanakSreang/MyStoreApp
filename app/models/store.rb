class Store < ActiveRecord::Base
  has_many :sub_domains, dependent: :destroy
  has_many :user_stores, dependent: :destroy
  belongs_to :address, dependent: :destroy
  has_many :users, through: :user_stores  

  accepts_nested_attributes_for  :address, allow_destroy: true
  accepts_nested_attributes_for  :sub_domains, allow_destroy: true
  accepts_nested_attributes_for  :user_stores, allow_destroy: true

  validates :name, presence: true
end