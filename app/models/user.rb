class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  has_many :categories
  has_many :products
  has_many :pictures
  has_many :orders
  validates_presence_of :password, :email
  validate :picture_size
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:facebook]

  def picture_size
    errors.add(:avatar, t('image_size')) if avatar.size > 5.megabytes
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if (data = session['devise.facebook_data'] &&
                session['devise.facebook_data']['extra']['raw_info'])
        user.email = data['email'] if user.email.blank?
      end
    end
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name
    end
  end
end
