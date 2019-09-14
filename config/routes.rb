Rails.application.routes.draw do
  get 'messages/index'
  get 'reviews/index'
  devise_for :users
  root to: "pages#home"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :activities, only: [ :index,:new, :create, :show] do
    resources :bookings, only: [ :create ]
    resources :reviews, only: [:create]
  end
  resources :bookings, only: [ :index ] do
    resources :messages, only: [:create, :new]
  end
  resources :reviews, only: [:index]

  namespace :seller do

    resources :activities, only: [:index, :new, :create, :show, :destroy]
    resources :bookings, only: [ :index ] do
     member do
         patch :confirmed
         patch :decline
      end
    end
  end

end
