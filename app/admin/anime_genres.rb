ActiveAdmin.register AnimeGenre do
  permit_params :anime_id, :genre_id
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :genre_id, :anime_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:genre_id, :anime_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
