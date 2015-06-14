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
  validates_length_of :password, minimum: 8, allow_blank: true, if: :provider?
  validates_confirmation_of :password,
                            message: "the password confirmation belove did not match",
                            if: :provider?
  validates_uniqueness_of :email, if: :provider?

  mount_uploader :avatar, AvatarUploader

  belongs_to :address, dependent: :destroy
  has_one :user_store, dependent: :destroy
  has_one :store, through: :user_store
  accepts_nested_attributes_for  :address, allow_destroy: true

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

  def password_required?
    super && provider.blank?
  end

  def email_required?
    super && provider.blank?
  end

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
