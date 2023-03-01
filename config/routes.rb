Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :pages do
    resources :costumes
  end
end
