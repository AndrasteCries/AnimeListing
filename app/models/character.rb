class Character < ApplicationRecord
  after_create :create_associated_anime_characters

  has_one_attached :image
  has_many :anime_characters
  has_many :animes, through: :anime_characters

  private

  def create_associated_anime_characters
    if self.anime_ids.present?
      self.anime_ids.each do |anime_id|
        AnimeCharacter.create(anime_id: anime_id, character_id: self.id)
      end
    end
  end
end
