Rails.application.routes.draw do
  resources :contacts
  resources :events
  resources :clients
  devise_for :users
  root to: "home#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
