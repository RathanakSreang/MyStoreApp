class Province < ActiveRecord::Base
  has_many :addresses
  validates_presence_of :name
end
