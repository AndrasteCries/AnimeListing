class AnimeCharacter < ApplicationRecord
  belongs_to :anime
  belongs_to :character

  def self.ransackable_attributes(auth_object = nil)
    ["anime_id", "character_id", "id", "id_value"]
  end

end
