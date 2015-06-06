class User < ActiveRecord::Base  
  enum role: [:normal, :admin]
  enum gender: [:female, :male]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable
  
  validates :email, presence: true, length: {maximum:50}
  validates_presence_of :name, :dob, :gender, :email, :password  
  validates_format_of :name, with: /\A[-\w\._@]+\z/i,
                      allow_blank: true, 
                      message: "should only contain letters, numbers, or .-_@"
  validates_length_of :password, minimum: 8, :allow_blank => true  
  validates_confirmation_of :password, message: "the password confirmation belove did not match"
  validates_uniqueness_of :email
  #VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]{2,}+\z/i
  #validates_format_of :email, with: VALID_EMAIL_REGEX  

  belongs_to :address
  accepts_nested_attributes_for  :address

end
