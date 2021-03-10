Rails.application.routes.draw do
  devise_for :users

  root to: "staffs#index"
  resources :staffs, only: [:new, :create, :index]
  resources :users, only: [:show, :update, :edit, :destroy]
end
