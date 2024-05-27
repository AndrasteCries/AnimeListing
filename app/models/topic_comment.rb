class TopicComment < ApplicationRecord
  belongs_to :topic
  belongs_to :user

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "date", "id", "id_value", "text", "topic_id", "updated_at"]
  end
end
