class Genre < ApplicationRecord
  has_many :anime_genres
  has_many :animes, through: :anime_genres

  def self.ransackable_associations(auth_object = nil)
    ["anime_genres", "animes"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["id", "name", "description", "created_at", "updated_at"]
  end
end
