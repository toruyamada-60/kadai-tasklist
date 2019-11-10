Rails.application.routes.draw do
  
  root to: 'tasks#index'
  
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  resources :tasks
  
  get 'signup', to: 'users#new'
  
  resources :users, only: [:index, :show, :new, :create]

end
