Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :pages
  resources :costumes, only: [:index, :new, :create, :show, :destroy] do
    resources :bookings, only: [:new, :create]
  end
    resources :bookings, only: [:show]
end
