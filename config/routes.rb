Rails.application.routes.draw do
  devise_for :users

  root to: "staffs#index"
 
  resources :users, only: [:show, :update, :edit, :destroy]
  resources :staffs, only: [:new, :create, :index, :edit , :update, :destroy,:show]do
    resources :appoints, only: [:index, :create, :new]
  end
end
