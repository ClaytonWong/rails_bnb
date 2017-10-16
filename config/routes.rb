Rails.application.routes.draw do
  devise_for :users
  resources :listings
  resources :conversations do
    resources :messages
  end

  resources :bookings, only: [:new, :create]
  get '/support' => 'support#new'
  post '/support' => 'support#create'

  #get '/bookings/new' => 'bookings#new', as: 'new_booking'
  #post '/bookings'=> 'bookings#create'
 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'
end
