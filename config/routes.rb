Rails.application.routes.draw do
  resources :users

  
  get 'attractions/new'
  get 'attractions/create'
  get 'attractions/show'
  get 'attractions/index'

  root 'users#homepage'

end
