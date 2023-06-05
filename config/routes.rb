Rails.application.routes.draw do
  resources :conferences
  get "/conference/:reference_number", to: "conferences#findByReferenceNumber"
  
end
