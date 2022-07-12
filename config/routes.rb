Rails.application.routes.draw do
  post 'contacts/confirm', to: 'contacts#confirm', as: 'confirm'
  post 'contacts/back', to: 'contacts#back', as: 'back'
  resources :contacts
  resources :blogs
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
