Rails.application.routes.draw do
  devise_for :users, path: "users", controllers: {
    session: "users/sessions",
    registrations: "users/registrations"
  }
  root "application#index"

  get "up" => "rails/health#show", as: :rails_health_check

end
