# config/routes.rb
Rails.application.routes.draw do
  devise_for :users
  root to: 'clients#index'
  resources :clients do
    resources :client_details
  end
  resources :events
  get 'home/index'
end
