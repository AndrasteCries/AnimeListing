ActiveAdmin.register Anime do
  permit_params do
    permitted = [:name, :description, :episodes, :duration, :score, :popularity, :rating, :yrating, :studio_id, :status]
    permitted << :other if params[:action] == 'create' && current_user.admin?
    permitted
  end


  form do |f|
    f.inputs 'Anime Details' do
      f.input :name
      f.input :description
      f.input :episodes
      f.input :popularity
      f.input :duration
      f.input :score
      f.input :rating
      f.input :yrating
      f.input :status, as: :select, collection: Anime.statuses.keys
      f.input :tags, as: :check_boxes
      f.input :genres, as: :check_boxes
      f.input :types, as: :check_boxes
      f.input :title_image, as: :file
    end
    f.actions
  end
  
end
