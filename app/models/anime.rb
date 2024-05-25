class Anime < ApplicationRecord
  # belongs_to :studio
  has_one_attached :title_image
  has_many :user_rates
  has_many :anime_tags
  has_many :anime_genres
  has_many :anime_types
  has_many :comments, dependent: :destroy


  enum status: {
    ongoing: 0,
    completed: 1,
    upcoming: 2
  }

  validates :name, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ["id", "name", "description", "episodes", "duration", "score", "popularity", "rating", "yrating", "status", "created_at", "updated_at", "studio_id"]
  end
end
