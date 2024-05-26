Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  root "application#index"
  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users, path: "users", controllers: {
    session: "users/sessions",
    registrations: "users/registrations"
  }
  resources :characters
  resources :animes do
    resources :comments, only: :create
  end
  resources :user_rates

  get "users/:id/", to: "user#show", as: :user_profile
  get "up" => "rails/health#show", as: :rails_health_check
end
