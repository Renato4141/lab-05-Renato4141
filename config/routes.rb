Rails.application.routes.draw do
  root "owners#index"

  resources :owners
  resources :pets
  resources :vets
  resources :appointments

  get "up" => "rails/health#show", as: :rails_health_check
end