Rails.application.routes.draw do
  root 'tops#index'
  get 'tops/index'  
  resources :talks do
    resources :messages
  end
  resources :favorites, only: [:create, :destroy]
  resources :profiles
  resources :golf_informations
  resources :blogs
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
end
