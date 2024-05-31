class Anime < ApplicationRecord
  has_one_attached :title_image
  has_many :user_rates, dependent: :destroy
  has_many :anime_tags, dependent: :destroy
  has_many :tags, through: :anime_tags
  has_many :anime_genres, dependent: :destroy
  has_many :genres, through: :anime_genres
  has_many :anime_types, dependent: :destroy
  has_many :types, through: :anime_types
  has_many :comments, dependent: :destroy
  has_many :anime_characters, dependent: :destroy
  has_many :characters, through: :anime_characters

  belongs_to :studio, optional: true

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
