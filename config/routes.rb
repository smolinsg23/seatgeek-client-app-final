Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/' => 'events#index'
  get '/events/:id' => 'events#show'
  get  '/events' => 'events#index'
  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  get '/users/:id' => 'users#show'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/bids' => 'bids#index'
  get '/bids/new' =>'bids#new'
  post '/bids' => 'bids#create' #@bid = Bid.new
  get '/bids/:id' => 'bids#show' #@bid = Bid.find_by(id: params[:id])
  get '/bids/:id/edit' => 'bids#edit' 
  patch '/bids/:id' => 'bids#update'
  delete '/bids/:id' => 'bids#destroy'
  get '/pages' => 'pages#index'
  get '/stats' => 'statistics#index'
  
  resources :charts, only: [] do
    collection do 
      get 'buy_now_bid_over_time'
  end
end
  

  
  namespace :api do
    namespace :v1 do
      get '/users/:id' => 'users#show'
       get '/bids' => 'bids#index'
       get '/buy_now_bids' => 'buy_now_bids#index'

    end
  end
end

  

