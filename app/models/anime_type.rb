class AnimeType < ApplicationRecord
  belongs_to :anime
  belongs_to :type

  def self.ransackable_attributes(auth_object = nil)
    ["id", "name", "created_at", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["anime", "type"]
  end
end
