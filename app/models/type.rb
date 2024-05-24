class Type < ApplicationRecord
  has_many :anime_types
  has_many :animes, through: :anime_types

  def self.ransackable_associations(auth_object = nil)
    ["anime_types", "animes"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["id", "name", "description", "created_at", "updated_at"]
  end
end
