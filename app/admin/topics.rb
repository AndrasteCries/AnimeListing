ActiveAdmin.register Topic do

  permit_params do
    permitted = [:title, :body]
    permitted << :other if params[:action] == 'create' && current_user.admin?
    permitted
  end


  form do |f|
    f.inputs 'Topic Details' do
      f.input :title
      f.input :body
      f.input :image, as: :file
    end
    f.actions
  end
  
end
