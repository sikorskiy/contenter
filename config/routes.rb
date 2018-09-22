Rails.application.routes.draw do
  resources :camps
  resources :companies
  get "/users/check_camp", to: "users#check_camp"
  get  "/camp/statistic", to: "camps#statistic"
  get  "/camp/check", to: "camps#check"
  get  "/users/index", to: "users#index"
  get  "/users/show", to: "users#show"
  devise_for :users
  
  root to: 'camps#index'
  post 'camps/autosave', to: 'camps#autosave'
end
