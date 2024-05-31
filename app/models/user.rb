class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  has_one_attached :image

  has_many :user_rates
  has_many :comments, dependent: :destroy
  has_many :topics
  has_many :topic_comments, dependent: :destroy

  enum role: { user: 0, moderator: 1, admin: 2 }

  validates :password, length: { minimum: 6 }, if: -> { password.present? }
  
  def admin?
    role == 'admin'
  end

  def self.ransackable_attributes(auth_object = nil)
    [
      "about", "birthday", "created_at", "current_sign_in_at", "current_sign_in_ip",
      "email", "encrypted_password", "id", "id_value", "last_sign_in_at", "last_sign_in_ip",
      "location", "name", "nickname", "remember_created_at", "reset_password_sent_at",
      "reset_password_token", "role", "sex", "updated_at", "website",
    ]
  end
end
