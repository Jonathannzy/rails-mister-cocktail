Rails.application.routes.draw do

  get 'doses/create'
  get 'doses/destroy'
  root to: 'cocktails#index'
  # get 'cocktails/index'
  # get 'cocktails/show'
  # get 'cocktails/new'
  # post 'cocktails/create'
  # put 'cocktails/update'
  # delete 'cocktails/delete'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :cocktails, only: ["index", "show", "new", "create"] do
    resources :doses, only: [:create]
  end
  resources :doses, only: [:destroy]
end
