Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/bookings', to:'pages#bookings'
  get '/mycelebrities', to:'pages#celebrities'
  patch '/confirm_booking/:id', to:'pages#confirm_booking', as: :confirm
  patch '/reject_booking/:id', to:'pages#reject_booking', as: :reject
  patch '/conclude_booking/:id', to:'pages#conclude_booking', as: :conclude


  resources :celebrities do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: [:show, :edit] do 
    resources :messages, only: [:index, :create]
  end

  resources :bookings, only: [] do
    resources :reviews, only: [:new, :create]
  end
  


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
