class AnimeTag < ApplicationRecord
  belongs_to :anime
  belongs_to :tag

  def self.ransackable_associations(auth_object = nil)
    ["anime", "tag"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["id", "anime_id", "tag_id", "created_at", "updated_at"]
  end
end
