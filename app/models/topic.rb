class Topic < ApplicationRecord
  belongs_to :user
  belongs_to :forum
  has_many :topic_tags
  has_many :forum_tag, through: :topic_tags
  has_many :topic_comments, dependent: :destroy
end
