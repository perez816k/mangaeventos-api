Rails.application.routes.draw do
<<<<<<< HEAD
  resources :invitations, controller: 'rails_jwt_auth/invitations', only: [:create, :update]
  resource :password, controller: 'rails_jwt_auth/passwords', only: [:create, :update]
  resource :confirmation, controller: 'rails_jwt_auth/confirmations', only: [:create, :update]
  resource :registration, controller: 'rails_jwt_auth/registrations', only: [:create]
  resource :session, controller: 'rails_jwt_auth/sessions', only: [:create, :destroy]
=======
>>>>>>> f356eae0d7ad0ef6aefc04aa696a01c0b5f21bfc
  resources :assistants
  resources :events
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
