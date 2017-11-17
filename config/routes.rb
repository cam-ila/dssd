Rails.application.routes.draw do
  get 'home/index'

  devise_for :users

  root to: "home#index"
  resources :incident_replacements
  resources :incicent_replacements
  resources :replacements
  resources :incidents
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
