class User < ActiveRecord::Base  
  enum role: [:normal, :admin]
  enum gender: [:female, :male]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  validates :name, :dob, :gender, presence: true

  belongs_to :address
  accepts_nested_attributes_for  :address
end
