class Topic < ApplicationRecord
  belongs_to :user
  belongs_to :forum
  has_many :topic_tags
  has_many :forum_tag, through: :topic_tags
  has_many :topic_comments, dependent: :destroy

  has_one_attached :image

  def self.ransackable_attributes(auth_object = nil)
    ["id", "title", "body", "image"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["forum", "forum_tag", "image_attachment", "image_blob", "topic_comments", "topic_tags", "user"]
  end
end


