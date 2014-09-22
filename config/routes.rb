Rails.application.routes.draw do
  concern :thumbs do
    resources :thumbs
  end


  root to: 'visitors#index'
  devise_for :users
  resources :beds, only: [:index, :show]

  namespace :back_end do
    resources :beds, only: [:index, :new, :create, :edit, :update, :show] do
      resources :colors, concerns: [:thumbs]
      resources :dimensions
      resources :kits, concerns: [:thumbs]
    end
  end
end
