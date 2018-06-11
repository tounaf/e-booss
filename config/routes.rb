Rails.application.routes.draw do
  # get 'etablissements/index'
  # get 'etablissements/show'
  # get 'etablissements/new'
  # get 'etablissements/create'
  # get 'etablissements/update'
  # get 'etablissements/delete'
  devise_for :users
  root 'home#index'
  resources :etablissements
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
