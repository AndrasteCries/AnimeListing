class AddCascadeDeleteToAnimeGenres < ActiveRecord::Migration[7.1]
  def change
    remove_foreign_key :anime_genres, :animes
    add_foreign_key :anime_genres, :animes, on_delete: :cascade
    remove_foreign_key :anime_tags, :animes
    add_foreign_key :anime_tags, :animes, on_delete: :cascade
    remove_foreign_key :anime_types, :animes
    add_foreign_key :anime_types, :animes, on_delete: :cascade
    remove_foreign_key :anime_characters, :animes
    add_foreign_key :anime_characters, :animes, on_delete: :cascade
  end
end
