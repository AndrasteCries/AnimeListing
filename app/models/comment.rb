class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :anime

  validates :text, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ["anime_id", "created_at", "id", "id_value", "text", "updated_at", "user_id"]
  end
end
