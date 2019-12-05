Rails.application.routes.draw do
  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :bikes do
    resources :bookings, only: [:create, :update]
  end
  get '/bookings/requests', to: 'bookings#request', as: :request
  get '/bookings/admin', to: 'bookings#admin', as: :admin
  root to: 'pages#home'
end
