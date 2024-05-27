class AddForumTagIdToTopics < ActiveRecord::Migration[7.1]
  def change
    add_column :topics, :forum_tag_id, :integer
  end
end
