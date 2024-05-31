class Studio < ApplicationRecord

  has_many :animes, dependent: :destroy
  has_many :persons

  validates :name, presence: true
  validates :short_name, presence: true
  validates :japanese, presence: true
  validates :website, presence: true

  def self.ransackable_associations(auth_object = nil)
    ["animes"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["id", "name", "short_name", "japanese", "website", "created_at", "updated_at"]
  end
end