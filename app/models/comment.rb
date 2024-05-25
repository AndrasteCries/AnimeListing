class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :anime

  validates :text, presence: true
end
