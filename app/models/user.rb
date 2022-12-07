class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  devise :omniauthable, omniauth_providers: [:github]

  validates :email, uniqueness: true
  validates :name, :password, :email, presence: true
  validates :password, length: { minimum: 6 }

  has_many :notes, dependent: :delete_all

  def self.from_omniauth(auth)
    user = find_by(email: auth.info.email, provider: nil, uid: nil)

    if user.present?
      update_user_with(auth: auth)
    else
      find_or_create_by(provider: auth.provider, uid: auth.uid) do |user|
        user.provider = auth.provider
        user.name =   auth.info.name
        user.uid = auth.uid
        user.email = auth.info.email
        user.password = Devise.friendly_token[0, 20]
        user.avatar = auth.info.image
      end
    end
  end

  def self.update_user_with(auth:)
    update(
      provider: auth.provider,
      uid: auth.uid,
      avatar: auth.info.image
    )

    self
  end
end
