ActiveAdmin.register Person do
  permit_params :name, :japanese, :website, :birthday, :spec, :studio_id, :image

  index do
    selectable_column
    id_column
    column :name
    column :japanese
    column :website
    column :birthday
    column :spec
    column :image
    column :studio
    column :created_at
    actions
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :japanese
      f.input :website
      f.input :birthday
      f.input :spec
      f.input :studio
      f.input :image, as: :file
    end
    f.actions
  end
end
