class Forum < ApplicationRecord
  has_many :topics

  def self.ransackable_attributes(auth_object = nil)
    ["id", "id_value", "position", "title"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["topics"]
  end
end
