Rails.application.routes.draw do
  resources :users
  resources :conferences
  get "/conference/:reference_number", to: "conferences#findByReferenceNumber"
  post "/login", to: "sessions#create"
  
end
