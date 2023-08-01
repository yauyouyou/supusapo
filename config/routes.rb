# config/routes.rb
Rails.application.routes.draw do
  devise_for :users
  root to: 'clients#index'
  resources :clients do
    resources :client_details
  end


  # スケジュールコントローラのindexアクションにGETリクエストを設定する
  get 'schedule/index', to: 'schedules#index'

  get 'home/index'
end
