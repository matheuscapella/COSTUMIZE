Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :pages
  resources :costumes, only: [:index, :new, :create, :show] do
    resources :bookings
  end
end
