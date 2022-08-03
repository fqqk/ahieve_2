Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users
  post 'contacts/confirm', to: 'contacts#confirm', as: 'confirm'
  post 'contacts/back', to: 'contacts#back', as: 'back'
  resources :users
  resources :contacts
  resources :blogs
  resources :blogs do
    resources :comments, only:[:create, :destroy, :update, :edit]
  end
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
