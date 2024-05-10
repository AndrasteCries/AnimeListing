class DatabaseInit < ActiveRecord::Migration[7.1]
  def change
    create_table :tags do |t|
      t.string :name, null: false
      t.text :description
      t.index :name, unique: true
    end
    create_table :genres do |t|
      t.string :name, null: false
      t.text :description
      t.index :name, unique: true
    end
    create_table :types do |t|
      t.string :name, null: false
      t.text :description
      t.index :name, unique: true
    end
    create_table :characters do |t|
      t.string :name, null: false
      t.string :japanese
      t.string :full_name
      t.text :description
      t.integer :from
      t.timestamps
    end
    create_table :studios do |t|
      t.string :name, null: false
      t.string :short_name
      t.string :japanese
      t.string :website
    end
    create_table :animes do |t|
      t.string :name, null: false
      t.text :description
      t.integer :episodes
      t.integer :duration
      t.integer :score
      t.float :popularity
      t.float :rating
      t.integer :yrating
      t.references :studio, foreign_key: true
      t.integer :status
      t.timestamps
    end
    create_table :reviews do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.text :opinion
      t.references :anime, foreign_key: true
      t.timestamps
    end
    create_table :comments do |t|
      t.text :text, null: false
      t.datetime :date
      t.references :anime, foreign_key: true
      t.timestamps
    end
    create_table :studio_animes do |t|
      t.references :studio, foreign_key: true
      t.references :anime, foreign_key: true
      t.index [:studio_id, :anime_id], unique: true
    end
    create_table :persons do |t|
      t.string :name, null: false
      t.string :japanese
      t.string :website
      t.date :birthday
      t.integer :spec
      t.references :studio, foreign_key: true
    end
    create_table :users do |t|
      t.string :name, null: false
      t.string :nickname, null: false
      t.string :location
      t.text :about
      t.string :sex
      t.string :website
      t.date :birthday
      t.datetime :last_activity
      t.string :email, null: false
      t.string :password
      t.integer :role
      t.timestamps
    end
    create_table :user_rates do |t|
      t.references :user, foreign_key: true
      t.references :anime, foreign_key: true
      t.float :score, null: false
      t.integer :episodes
      t.integer :volumes
      t.integer :chapters
      t.text :comment
      t.integer :revision
      t.integer :status
      t.timestamps
    end
    create_table :forums do |t|
      t.string :title, null: false
      t.integer :position
    end
    create_table :topics do |t|
      t.string :title, null: false
      t.references :user, foreign_key: true
      t.references :forum, foreign_key: true
      t.text :body
      t.timestamps
    end
    create_table :forum_tags do |t|
      t.string :name, null: false
      t.text :description
    end
    create_table :topic_tags do |t|
      t.references :topic, foreign_key: true
      t.references :forum_tags, foreign_key: true
      t.index [:topic_id, :forum_tags_id], unique: true
    end
    create_table :topic_comment do |t|
      t.text :text, null: false
      t.datetime :date
      t.references :topic, foreign_key: true
      t.timestamps
    end
  end
end
