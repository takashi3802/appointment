Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }

  root to: "staffs#index"
 
  resources :users, only: [:show, :update, :edit, :destroy]
  resources :staffs, only: [:new, :create, :index, :edit , :update, :destroy,:show]do
    resources :appoints, only: [:create, :new]
    resources :messages, only: [:create]
  end
 
end
