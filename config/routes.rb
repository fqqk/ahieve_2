Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users
  post 'contacts/confirm', to: 'contacts#confirm', as: 'confirm'
  post 'contacts/back', to: 'contacts#back', as: 'back'
  resources :users do
    resource :relationships, only: [:create, :destroy]
    get :followings, on: :member #on: :memberでルーティングにidを含められる
    get :followers, on: :member
  end
  # resources :relationships
  resources :contacts
  resources :blogs do
    resources :comments, only:[:create, :destroy, :update, :edit]
  end
  resources :favorites, only: [:create, :destroy, :index]
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
