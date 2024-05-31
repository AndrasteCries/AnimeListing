class Person < ApplicationRecord

  belongs_to :studio

  enum spec: {
    producer: 0,
    mangaka: 1,
    seyu: 2
  }

  validates :name, presence: true
  validates :japanese, presence: true
  validates :website, presence: true
  validates :birthday, presence: true
  validates :spec, presence: true
  validates :image, presence: true

  has_one_attached :image

  def self.ransackable_attributes(auth_object = nil)
    ["id", "name", "japanese", "website", "birthday", "spec", "studio_id", "created_at", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["image_attachment", "image_blob"]
  end
end