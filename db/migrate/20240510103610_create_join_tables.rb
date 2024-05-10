class CreateJoinTables < ActiveRecord::Migration[7.1]
  def change
    create_table :anime_tags do |t|
      t.references :tag, foreign_key: true
      t.references :anime, foreign_key: true
      t.index [:anime_id, :tag_id], unique: true
    end
    create_table :anime_genres do |t|
      t.references :genre, foreign_key: true
      t.references :anime, foreign_key: true
      t.index [:anime_id, :genre_id], unique: true
    end
    create_table :anime_types do |t|
      t.references :type, foreign_key: true
      t.references :anime, foreign_key: true
      t.index [:anime_id, :type_id], unique: true
    end
    create_table :anime_characters do |t|
      t.references :anime, foreign_key: true
      t.references :character, foreign_key: true
      t.index [:anime_id, :character_id]
    end
  end
end
