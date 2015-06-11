class User < ActiveRecord::Base  
  enum role: [:normal, :admin]
  enum gender: [:female, :male]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :omniauthable
  
  validates :email, presence: true, length: {maximum:50}, if: :provider?
  validates_presence_of :name, :dob, :gender, :email, if: :provider?
  #validates_format_of :name, with: /\A[-\w\._@]+\z/i, allow_blank: true, 
   #                   message: "should only contain letters, numbers, or .-_@",
   #                   if: :provider?
  validates_length_of :password, minimum: 8, allow_blank: true, if: :provider?
  validates_confirmation_of :password,
                            message: "the password confirmation belove did not match",
                            if: :provider?
  validates_uniqueness_of :email, if: :provider?
  #VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]{2,}+\z/i
  #validates_format_of :email, with: VALID_EMAIL_REGEX  

  mount_uploader :avatar, AvatarUploader

  belongs_to :address

  accepts_nested_attributes_for  :address

  def self.from_omniath auth
    where(provider: auth.provider, uid: auth.uid).first_or_initialize do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name

      if auth.provider == "twitter"
        user.url = auth.info.urls.Twitter
        user.email = "#{auth.uid}.twitter@twitter.com"#auth.info.email        
      elsif auth.provider == "facebook"        
        user.email = auth.info.email
        user.url = auth.info.urls.Facebook
        user.gender = self.get_gender auth.extra.raw_info.gender
      else        
        user.email = auth.info.email
        user.url = auth.extra.raw_info.profile
        user.gender = self.get_gender auth.extra.raw_info.gender
        user.dob = auth.extra.raw_info.birthday
      end
      user.skip_confirmation!
      user.save
    end
  end

  # def self.new_with_session params, session
  #   if session["devise.user_attributes"]
  #     new(session["devise.user_attributes"], without_protection: true) do |user|
  #       user.attributes = params
  #       user.valid?
  #     end
  #   else
  #     super
  #   end
  # end

  def password_required?
    super && provider.blank?
  end

  def email_required?
    super && provider.blank?
  end

  # def update_with_password params, *options
  #   if encrypted_password.blank?
  #     update_attributes params, *option
  #   else
  #     super
  #   end
  # end

  def provider?
    provider.blank?
  end

  def self.get_gender gender
    if gender == "male"
      :male
    else
      :female
    end
  end
end
