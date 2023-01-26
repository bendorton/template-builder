Rails.application.routes.draw do
  devise_for :users
  get 'template/view'
  get 'template/list'
  get 'profile/view'
  get 'profile/edit'
  get 'profile/upload'
  get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "home#index"
end
