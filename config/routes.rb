Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :blogs
  devise_for :users,
    controllers: { registrations: 'registrations' }
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  root 'tops#index'

  resources :users, only: [:show]
end
