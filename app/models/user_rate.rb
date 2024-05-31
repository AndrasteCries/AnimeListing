class UserRate < ApplicationRecord
  belongs_to :user
  belongs_to :anime
  self.record_timestamps = true
  enum status: {
    ongoing: 0,
    completed: 1,
    upcoming: 2
  }

  def self.ransackable_attributes(auth_object = nil)
    ["anime_id", "chapters", "comment", "created_at", "episodes", "id", "id_value", "revision", "score", "status", "updated_at", "user_id", "volumes"]
  end
end
