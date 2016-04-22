Rails.application.routes.draw do
  devise_for :users
  root to: "attractions#index"
  get 'attractions/search', to: 'attractions#search'
  put '/attractions/update_photo', to: 'attractions#update_photo'
  # namespace :api do
  #   resources :attractions
  # end

  resources :users, only: [:show]
  resources :attractions
  resources :visits, only: [:create]
  get 'comments/jsdelete', to: 'comments#js_delete'
  resources :comments, only: [:create]
  mount Commontator::Engine => '/commontator'

end
