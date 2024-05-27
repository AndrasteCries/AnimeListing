class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_rates
  has_many :comments, dependent: :destroy
  has_many :topics
  has_many :topic_comments, dependent: :destroy

  enum role: { user: 0, moderator: 1, admin: 2 }
  
  def admin?
    role == 'admin'
  end
end
