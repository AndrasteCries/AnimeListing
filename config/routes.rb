Rails.application.routes.draw do
  devise_for :users, path: "users", controllers: {
    session: "users/sessions",
    registrations: "users/registrations"
  }

  get "users/:id/", to: "user#show", as: :user_profile

  root "application#index"

  resources :animes

  get "up" => "rails/health#show", as: :rails_health_check
end
