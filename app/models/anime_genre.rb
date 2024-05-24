class AnimeGenre < ApplicationRecord
  belongs_to :anime
  belongs_to :genre

  def self.ransackable_associations(auth_object = nil)
    ["anime", "genre"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["id", "anime_id", "genre_id", "created_at", "updated_at"]
  end
end
