Rails.application.routes.draw do
  resources :content_camps
  resources :camps
  resources :companies
  devise_for :users
  root to: 'camps#index'
end
