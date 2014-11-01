Rails.application.routes.draw do
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
      resource  :kit_prices, controller: 'kit_prices', only: [:show, :edit, :update]
    end
    resources :bed_purchases, only: [:index]

    resources :linens, only: [:index, :new, :create, :edit, :update, :show], concerns: [:thumbs] do
      resources :dimensions
      resources :kits, concerns: [:thumbs]
      resource  :prices, controller: 'linen_prices', only: [:show, :edit, :update]
    end
    resources :linen_purchases, only: [:index]
  end
end
