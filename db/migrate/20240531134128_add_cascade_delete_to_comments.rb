class AddCascadeDeleteToComments < ActiveRecord::Migration[7.1]
  def change
    remove_foreign_key :comments, :animes
    add_foreign_key :comments, :animes, on_delete: :cascade
  end
end
