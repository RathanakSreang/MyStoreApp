class Address < ActiveRecord::Base
  belongs_to :province  
  has_one :user  
end
