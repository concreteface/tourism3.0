Rails.application.routes.draw do
  # devise_for :users
  mount Commontator::Engine => '/commontator'
  root to: "attractions#index"
  get 'attractions/search', to: 'attractions#search'
  put '/attractions/update_photo', to: 'attractions#update_photo'
  put '/attractions/update_location', to: 'attractions#update_location'
  devise_for :users, controllers: { registrations: :registrations }

  put '/users/update_photo', to: 'users#update_photo'
  resources :users, only: [:show]
  resources :attractions
  resources :visits, only: [:create, :destroy]

  namespace :api do
    resources :attractions
  end

end
