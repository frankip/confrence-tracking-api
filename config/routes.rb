Rails.application.routes.draw do
  resources :participations
  resources :participant_ids
  resources :participants
  resources :users
  resources :conferences

  get "/statistics", to: "conferences#stats"

  get "/monthly/tally", to: "conferences#monthly_confs"
  get "/yearly/tally", to: "conferences#yearly_confs"
  get "/foreign/vs/kenyan", to: "conferences#foreign_vs_kenyan"
  get "/yearly/foreign/vs/kenyan", to: "conferences#yearly_foreign_vs_kenyan"
  get "/monthly/foreign/vs/kenyan", to: "conferences#monthly_foreign_vs_kenyan"

  get "/conference/:reference_number", to: "conferences#findByReferenceNumber"
  post "/login", to: "sessions#create"
  get "/me", to: "sessions#me"
  get "/logout", to: "sessions#logout"

  delete "/conference/:reference_number", to: "conferences#delete_conference"
  patch "/conference/:reference_number", to: "conferences#update_conference"

  post "/message", to: "conferences#receive_message"
end
