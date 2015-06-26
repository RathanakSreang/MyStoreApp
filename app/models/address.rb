class Address < ActiveRecord::Base
  belongs_to :province  
  has_one :user
  has_one :store

  validates :phone, :village, :commune, :district,
            presence: true
  def first_address    
    (house_no.present? ? "No.#{house_no}, " : "") +
    (street_no.present? ? "st #{street_no}, "  : "") +
    (village.present? ? "#{village}, " : "") +
    (commune.present? ? "#{commune}" : "")
  end

  def second_address
    (district.present? ? "#{district}, " : "") +
    (province.name.present? ? "#{province.name}" : "")
  end
end
