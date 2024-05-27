class AddUserIdToTopicComments < ActiveRecord::Migration[7.1]
  def change
    add_column :topic_comments, :user_id, :integer
    add_index :topic_comments, :user_id
  end
end
