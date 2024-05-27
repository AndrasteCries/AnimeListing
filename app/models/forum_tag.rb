class ForumTag < ApplicationRecord
  has_many :topic_tags
  has_many :topics, through: :topic_tags

  def self.ransackable_associations(auth_object = nil)
    ["topic_tags", "topics"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["id", "name", "description", "created_at", "updated_at"]
  end
end
