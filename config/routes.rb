Rails.application.routes.draw do
  resources :camps
  resources :companies
  resources :badges
  resources :users
  devise_for :users
  root to: 'camps#index'
  post 'camps/autosave', to: 'camps#autosave'
  get '/camp/statistics', to: 'camps#statistics'
end
