class Person < ApplicationRecord

  belongs_to :studio

  enum spec: {
    producer: 0,
    mangaka: 1,
    seyu: 2
  }

  validates :name, presence: true
  validates :spec, presence: true
  validates :birth, presence: true
  validates :image, presence: true

  has_one_attached :image

  def self.ransackable_attributes(auth_object = nil)
    ["id", "name", "japanese", "website", "birthday", "spec", "studio_id", "created_at", "updated_at"]
  end
end