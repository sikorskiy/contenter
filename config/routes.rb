Rails.application.routes.draw do
  resources :camps
  resources :companies
  get  "/users/index", to: "users#index"
  devise_for :users
  root to: 'camps#index'
  post 'camps/autosave', to: 'camps#autosave'
end
