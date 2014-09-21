Rails.application.routes.draw do

  root to: 'visitors#index'
  devise_for :users
  resources :beds, only: [:index, :show]
  namespace :back_end do
    resources :beds, only: [:index, :new, :create, :edit, :update, :show]
  end
end
