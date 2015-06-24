class StoreLogo < ActiveRecord::Base
  after_save :check_visible_logo
  belongs_to :store

  validates :title, :description, :logo, presence: true

  mount_uploader :logo, LogoUploader

  scope :visible_logos, ->{
    where visible: true
  }

  private
  def check_visible_logo
    if store.store_logos.visible_logos.size > 4
      store.store_logos.visible_logos.order("updated_at").first.update visible: false
    end
  end
end
