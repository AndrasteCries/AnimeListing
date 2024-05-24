class UserRate < ApplicationRecord
  belongs_to :user
  belongs_to :anime
  self.record_timestamps = true
  enum status: {
    ongoing: 0,
    completed: 1,
    upcoming: 2
  }
end
