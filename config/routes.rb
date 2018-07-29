Rails.application.routes.draw do
  resources :camps
  resources :companies
  devise_for :users
  root to: 'camps#index'
end
