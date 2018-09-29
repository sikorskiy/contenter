Rails.application.routes.draw do
  resources :camps
  resources :companies
  resources :badges
  #resources :users
  get "/users/check_camp", to: "users#check_camp"
  get  "/camp/statistic", to: "camps#statistic"
  get  "/camp/check", to: "camps#check"
  get "camp/track", to: "camps#track"
  get  "/users/index", to: "users#index"
  get  "/users/show", to: "users#show"
  
  devise_for :users
  root to: 'camps#index'
  post 'camps/autosave', to: 'camps#autosave'
  get '/camp/statistics', to: 'camps#statistics'
end
