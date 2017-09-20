Rails.application.routes.draw do
  root to: 'home#index'

  resources :orders, only: [:index, :show, :create, :new]

  resources :users, only: [:new, :create, :edit, :update]

  get "/dashboard", to:'users#show', as: 'dashboard'

  delete "/logout", to: 'sessions#destroy', as: 'logout'
  get "/login", to: 'sessions#new', as: 'login'
  post "/login", to: 'sessions#create'

  resources :items, only:[:new, :create, :index, :show]

  resource :cart

  get '/:category', to: 'categories#show', param: :slug, as: "category"

  namespace :admin do
    get "/dashboard", to: "users#show", as: "dashboard"
    get '/ordered', to: "orders#show"
    get '/paid', to: "orders#show"
    get '/cancelled', to: "orders#show"
    get '/completed', to: "orders#show"
    resources :items, only: [:new]
  end

  post 'retire' => 'users#retire_item', as: :retire

  post '/cancel', to: "orders#cancel", as: "cancel"
  post '/paid', to: "orders#paid", as: "paid"
  post '/completed', to: "orders#completed", as: "completed"
end
