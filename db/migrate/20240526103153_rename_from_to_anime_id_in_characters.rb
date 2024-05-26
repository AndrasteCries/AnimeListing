class RenameFromToAnimeIdInCharacters < ActiveRecord::Migration[7.1]
  def change
    rename_column :characters, :from, :anime_id
  end
end
