class Tag < ApplicationRecord
  has_many :anime_tags
  has_many :animes, through: :anime_tags

  def self.ransackable_associations(auth_object = nil)
    ["anime_tags", "animes"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["id", "name", "description", "created_at", "updated_at"]
  end
end
