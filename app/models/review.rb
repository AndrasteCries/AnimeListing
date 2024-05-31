class Review < ApplicationRecord
  belongs_to :user
  belongs_to :anime

  validates :text, presence: true
  validates :rating, presence: true, numericality: { only_integer: true,
                                                     greater_than_or_equal_to: 1,
                                                     less_than_or_equal_to: 10 }

  has_one_attached :image

  def self.ransackable_attributes(auth_object = nil)
    ["id", "user_id", "body", "opinion", "before_release", "comments_count", "created_at", "updated_at"]
  end
end