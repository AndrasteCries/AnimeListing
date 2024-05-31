Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :admin_users, ActiveAdmin::Devise.config
  root "application#index"
  scope "/:locale" do
    devise_for :users, path: "users", controllers: {
      session: "users/sessions",
      registrations: "users/registrations"
    }
    resources :topics do
      resources :topic_comments, only: :create
    end
    resources :forums
    resources :forum_tags
    resources :characters
    resources :animes do
      resources :comments, only: :create
    end
    resources :user_rates
    resources :user

    resources :studios

    get "users/:id/", to: "user#show", as: :user_profile
    get "users/:id/edit", to: "user#edit", as: :edit_user_profile
    get "up" => "rails/health#show", as: :rails_health_check
  end
end
