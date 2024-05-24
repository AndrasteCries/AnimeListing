ActiveAdmin.register Genre do
  permit_params :name, :description

  form do |f|
    f.inputs 'Genre Details' do
      f.input :name
      f.input :description
    end
    f.actions
  end

  index do
    selectable_column
    id_column
    column :name
    column :description
    actions
  end
end
