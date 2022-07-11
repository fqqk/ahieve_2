Rails.application.routes.draw do
  post 'contacts/confirm', to: 'contacts#confirm',as: 'confirm'
  post 'contacts/back', to:"contacts#back",as:"back"
  resources :contacts
  resources :blogs
end
