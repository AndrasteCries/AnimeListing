Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, path: "users", controllers: {
    session: "users/sessions",
    registrations: "users/registrations"
  }

  get "users/:id/", to: "user#show", as: :user_profile

  root "application#index"

  resources :animes
  resources :user_rates

  get "up" => "rails/health#show", as: :rails_health_check
end
