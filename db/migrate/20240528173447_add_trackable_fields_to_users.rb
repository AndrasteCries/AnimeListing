class AddTrackableFieldsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :sign_in_count, :integer, default: 0, null: false
  end
end
