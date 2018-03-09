Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: redirect('/users')

  resources :users, only: [:index, :show, :new, :create]

  resources :bands

  resources :albums, except: [:index]

  resources :tracks

  resource :session, only: [:new, :create, :destroy]


end
