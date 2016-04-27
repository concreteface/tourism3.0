Rails.application.routes.draw do
  devise_for :users
  mount Commontator::Engine => '/commontator'
  root to: "attractions#index"
  get 'attractions/search', to: 'attractions#search'
  put '/attractions/update_photo', to: 'attractions#update_photo'
  put '/attractions/update_location', to: 'attractions#update_location'

  resources :users, only: [:show]
  resources :attractions
  resources :visits, only: [:create, :destroy]
  
end
