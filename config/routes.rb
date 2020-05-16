Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/bookings', to:'pages#bookings'
  patch '/confirm_booking/:id', to:'pages#confirm_booking', as: :confirm

  resources :celebrities do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: [:show, :edit]

  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end  


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
