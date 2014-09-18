Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users
  resources :items, only: [:index]
  namespace :back_end do
    resources :items, only: [:index, :new, :create, :edit, :update, :destroy]
  end
end
