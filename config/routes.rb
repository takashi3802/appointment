Rails.application.routes.draw do
  devise_for :users

  root to: "staffs#index"
  resources :staffs, only: [:new, :create, :index, :edit , :update, :destroy]
  resources :users, only: [:show, :update, :edit, :destroy]
  resources :appoints, only: [:index, :create]
end
