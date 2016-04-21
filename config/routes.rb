Rails.application.routes.draw do
  devise_for :users
  root to: "attractions#index"
  get 'attractions/search', to: 'attractions#search'
  resources :users, only: [:show]
  # get 'now_using', to: "users#now_using"
  resources :attractions
  resources :visits, only: [:create]
  get 'comments/jsdelete', to: 'comments#js_delete'
  resources :comments, only: [:create]
  mount Commontator::Engine => '/commontator'
  
end
