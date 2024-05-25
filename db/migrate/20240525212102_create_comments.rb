class CreateComments < ActiveRecord::Migration[7.1]
  def change
    change_table :comments do |t|
      t.references :user, null: false, foreign_key: true
    end
    remove_column :comments, :date
  end
end
