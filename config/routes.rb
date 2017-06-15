Rails.application.routes.draw do

  get '/signin', to: 'sessions#new', as: 'signin'
  get '/signup', to: 'users#new', as: 'signup'
  resources :users, only: [:new, :create, :show, :edit, :update]
  resources :sessions, only: [:new, :create, :destroy]
  get '/attractions', to: 'attractions#index', as: 'attractions'
  resources :attractions do
    member do
      post 'ride'
    end
  end

  root 'welcome#index'

end
