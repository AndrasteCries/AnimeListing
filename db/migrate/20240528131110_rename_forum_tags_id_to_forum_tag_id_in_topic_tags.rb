class RenameForumTagsIdToForumTagIdInTopicTags < ActiveRecord::Migration[7.1]
  def change
    rename_column :topic_tags, :forum_tags_id, :forum_tag_id
  end
end
