Rails.application.routes.draw do
  root to: 'clients#index'
  resources :clients do
    resources :client_details
  end
end
