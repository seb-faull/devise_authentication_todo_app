Rails.application.routes.draw do
  devise_for :users
  resources :todos

  root "static#home"
end
