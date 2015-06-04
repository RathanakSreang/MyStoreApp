class Address < ActiveRecord::Base
  belongs_to :province  
  has_one :user

  validates :phone, :house_no, :street_no, :village, :commune,
      :district, :province_id, presence: true
end
