class Address < ActiveRecord::Base
  belongs_to :province  
  has_one :user
  has_one :store

  validates :phone, :village, :commune, :district,
            presence: true
  def full_address
    [house_no, street_no, village, commune, district, province.name].join(",")
  end
end
