Rails.application.routes.draw do
  resources :bookings do
    member do
      put :cancel
    end
  end

  resources :hotels
  resources :users, only: [:index]
end
