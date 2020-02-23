Rails.application.routes.draw do
  root 'home#home'

  resources :animals

  get 'signup', to: 'users#new'
  resources :users, except: [:new]

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'search_animal', to: 'animals#search'
  resources :categories, except: [:destroy]
end
