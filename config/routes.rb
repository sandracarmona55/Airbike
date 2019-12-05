Rails.application.routes.draw do
  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :bikes do
    resources :bookings, only: [:create]
  end
  get '/bookings/index_requests', to: 'bookings#index_requests', as: :index_requests
  get '/bookings/index_admin', to: 'bookings#index_admin', as: :index_admin

  resources :bookings, only: [] do
    member do
      patch '/accept', to: 'bookings#accept', as: :accept
      patch '/reject', to: 'bookings#reject', as: :reject
    end
  end
  root to: 'pages#home'
end
