class Address < ActiveRecord::Base
  belongs_to :province  
  has_one :user
  has_one :store
  def full_address
    [house_no, street_no, village, commune, district, province.name].join(",")
  end
end
