Rails.application.routes.draw do
  # resources :users
  # get 'users' , to: 'users#index'
  # post 'users' , to: 'users#create'
  # get 'users/new' , to: 'users#new'
  # get 'users/:id/edit' , to: 'users#edit'
  # get 'users/:id' , to: 'users#show'
  # patch 'users/:id' , to: 'users#update'
  # put 'users/:id' , to: 'users#update'
  # delete 'users/:id' , to: 'users#destroy'

  resources :users, only: [:index, :show, :create, :update, :destroy]

  resources :users do
    resources :contacts, only: [:index]
    # get 'users/:user_id/contacts' , to: 'contacts#index'
  end

  resources :contacts, only: [:show, :create, :update, :destroy]

  resources :users do
    resources :comments
  end



  resources :contacts do
    resources :comments
  end

  get 'users/:user_id/favorites' , to: 'users#favorites'

  resources :contact_shares, only: [:create, :destroy]

  resources :comments, only: [:create, :destroy]

end
