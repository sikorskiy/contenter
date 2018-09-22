Rails.application.routes.draw do
  resources :camps
  resources :companies
<<<<<<< HEAD
  get "/users/check_camp", to: "users#check_camp"
  get  "/camp/statistic", to: "camps#statistic"
  get  "/camp/check", to: "camps#check"
  get  "/users/index", to: "users#index"
  get  "/users/show", to: "users#show"
  devise_for :users
  
=======
  resources :badges
  devise_for :users
  resources :users
>>>>>>> ddd3020b0e3bca43eb5bc40aaa4117c6bc116a79
  root to: 'camps#index'
  post 'camps/autosave', to: 'camps#autosave'
  get '/camp/statistics', to: 'camps#statistics'
end
