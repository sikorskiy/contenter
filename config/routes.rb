Rails.application.routes.draw do
  resources :camps
  resources :companies
  resources :badges
  devise_for :users
  resources :users
  root to: 'camps#index'
  post 'camps/autosave', to: 'camps#autosave'
  get '/camp/statistics', to: 'camps#statistics'
  get '/camp/payments', to: 'camps#payments'
  get 'downloads', to: 'application#downloads'
end
