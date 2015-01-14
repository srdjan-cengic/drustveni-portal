DrustveniPortal::Application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'logout' => 'sessions#destroy', as: :log_out
  root 'home#index'
  resources :sessions, only: [:create]
  resources :users, only: [:new, :create, :show, :destroy]
  resources :entries, only: [:new, :create]
  resources :comments

  # Non-restful routes
  get '/:category_name' => 'home#index', as: :filter
  get 'vote_up/:storage_id' => 'home#vote_up', as: :vote_up
  get 'vote_down/:storage_id' => 'home#vote_down', as: :vote_down
  
end