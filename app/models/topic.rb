class Topic < ApplicationRecord
  after_create :create_associated_topic_tags

  belongs_to :user
  belongs_to :forum
  has_many :forum_tags, through: :topic_tags
  has_many :topic_tags
  has_many :topic_comments, dependent: :destroy

  has_one_attached :image

  def self.ransackable_attributes(auth_object = nil)
    ["id", "title", "body", "image"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["forum", "forum_tag", "image_attachment", "image_blob", "topic_comments", "topic_tags", "user"]
  end

  def create_associated_topic_tags
    if self.forum_tag_id.present?
      self.forum_tag_id.each do |tag_id|
        TopicTag.create(forum_tag_id: tag_id, topic_id: self.id)
      end
    end
  end
end


