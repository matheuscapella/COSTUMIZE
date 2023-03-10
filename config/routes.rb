Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :pages
  resources :costumes, only: [:index, :new, :destroy, :create, :show] do
    resources :bookings, only: [:new, :create]
  end
    resources :bookings, only: [:show]
end
