Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  resources :clock_events, except: [:index,:show]
end
