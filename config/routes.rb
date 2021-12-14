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
  devise_for :users
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
