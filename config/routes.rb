Rails.application.routes.draw do
  devise_for :users
  root to: "attractions#index"

  resources :users, only: [:show]
  # get 'now_using', to: "users#now_using"


  resources :attractions

  resources :visits, only: [:create]
  resources :comments, only: [:create]

end
