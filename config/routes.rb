Rails.application.routes.draw do
  get 'contacts/new'
  get 'contacts/confirm'
  get 'contacts/back'
  get 'contacts/create'
  resources :blogs
end
