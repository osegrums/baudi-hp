Rails.application.routes.draw do
  mount Bootsy::Engine => '/bootsy', as: 'bootsy'
  concern :thumbs do
    resources :thumbs
  end

  root to: 'high_voltage/pages#show', id: 'home'

  devise_for :users
  resources :beds, only: [:index, :show] do
    resources :bed_purchases
  end

  namespace :back_end do
    resources :beds, only: [:index, :new, :create, :edit, :update, :show], concerns: [:thumbs] do
      resources :colors, concerns: [:thumbs]
      resources :dimensions
      resources :kits, concerns: [:thumbs]
      resource  :prices, controller: 'bed_prices', only: [:show, :edit, :update]
    end
  end
end
