Rails.application.routes.draw do
  resources :profiles
  devise_for :users, controllers: { registrations: 'registrations' }
  get 'template/view'
  get 'template/list'
  get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: 'home#index'
end
