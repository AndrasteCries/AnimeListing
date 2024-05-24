class Anime < ApplicationRecord
  # belongs_to :studio
  has_one_attached :title_image
  has_many :user_rates

  enum status: {
    ongoing: 0,
    completed: 1,
    upcoming: 2
  }



  validates :name, presence: true
end
