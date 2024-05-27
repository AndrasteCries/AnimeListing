class TopicTag < ApplicationRecord
  belongs_to :topic
  belongs_to :forum_tag

  def self.ransackable_attributes(auth_object = nil)
    ["forum_tags_id", "id", "id_value", "topic_id"]
  end
end
