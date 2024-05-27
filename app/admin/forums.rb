ActiveAdmin.register Forum do
  permit_params :title, :position, :other_attribute

  form do |f|
    f.inputs 'Forum Details' do
      f.input :title
      f.input :position
    end
    f.actions
  end
  
end
