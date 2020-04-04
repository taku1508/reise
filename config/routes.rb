Rails.application.routes.draw do

  get 'likes/create'
  get 'likes/destroy'
  devise_for :users
  root to:"posts#index"
  resources :posts
  resources :users, only: [:show]

end