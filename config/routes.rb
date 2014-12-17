DrustveniPortal::Application.routes.draw do
  root 'home#index'
  resources :sessions, only: [:create]
  resources :users, only: [:new, :create]
  resources :entries, only: [:new, :create]

  # Non-restful routes
  get 'vote_up/:storage_id' => 'home#vote_up', as: :vote_up
  get 'vote_down/:storage_id' => 'home#vote_down', as: :vote_down
  get 'logout' => 'sessions#destroy', as: :log_out
end
