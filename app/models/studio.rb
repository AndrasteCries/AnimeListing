class Studio < ApplicationRecord

  has_many :animes, dependent: :destroy

  validates :name, presence: true
  validates :short_name, presence: true
  validates :japanese, presence: true
  validates :authors, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :image, presence: true
  validates :website, presence: true

  def self.ransackable_associations(auth_object = nil)
    ["animes"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["id", "name", "short_name", "japanese", "authors", "image", "website", "created_at", "updated_at"]
  end
end