class Store < ActiveRecord::Base
  has_many :sub_domains, dependent: :destroy
  has_many :user_stores, dependent: :destroy
  belongs_to :address, dependent: :destroy
  has_many :users, through: :user_stores  

  accepts_nested_attributes_for  :address
  accepts_nested_attributes_for  :sub_domains
  accepts_nested_attributes_for  :user_stores

  validates :name, presence: true
end
