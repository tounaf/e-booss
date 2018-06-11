Rails.application.routes.draw do
  
  devise_for :users
  root 'home#index'
  resources :etablissements
  resources :articles
  resources :filieres
  resources :niveaus
  resources :niveausups
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
  