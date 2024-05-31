class Person < ApplicationRecord

  has_many :anime_characters
  has_many :animes, through: :anime_characters
  has_many :comments, dependent: :destroy

  enum spec: {

  }

  validates :name, presence: true
  validates :spec, presence: true
  validates :birth, presence: true
  validates :image, presence: true

  has_one_attached :image

  def self.ransackable_attributes(auth_object = nil)
    ["id", "name", "japanese", "image", "website", "spec", "birth", "created_at", "updated_at"]
  end
end