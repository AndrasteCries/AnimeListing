ActiveAdmin.register Studio do
  permit_params :name, :short_name, :japanese, :authors, :image, :website

  # Якщо ви додаєте фільтри, переконайтеся, що вони правильні
  filter :name
  filter :short_name
  filter :animes_name, as: :string

  index do
    selectable_column
    id_column
    column :name
    column :short_name
    column :japanese
    column :website
    actions
  end
end
