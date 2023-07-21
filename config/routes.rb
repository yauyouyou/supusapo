Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  resources :clients do
    resources :client_details
  end
end
