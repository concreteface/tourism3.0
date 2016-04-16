Rails.application.routes.draw do
  devise_for :users
  root to: "attractions#index"

  resources :users, only: [:show]
  # get 'now_using', to: "users#now_using"


  resources :attractions, only: [:index, :show, :create, :new] do
    resources :comments, only: [:new, :create, :show]
  end

  resources :visits, only: [:create]

end
