Rails.application.routes.draw do
  root to: "customer/homes#top"
  get '/about' => 'customer/homes#about'
  get '/items' => 'customer/items#index'
  
  devise_for :end_user, controllers: {
    sessions: 'end_users/sessions',
    passwords: 'end_users/passwords',
    registrations: 'end_users/registrations'
  }
    
  devise_for :admin, controllers: {
    sessions: 'admins/sessions',
    passwords: 'admins/passwords'
  }
    
  namespace :customer do
    get '/confirm' => 'customers#confirm'
    resource :customers, only: [:show, :edit, :update]
    patch '/withdrawal' => 'customers#withdrawal'
    resources :items, only: [:index, :show]
    resources :cart_items, only: [:index, :update, :create]
    delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
    delete '/cart_items/:id' => 'cart_items#destroy'
    resources :orders, only: [:index, :new, :create]
    post '/orders/confirm' => 'orders#order_confirm'
    get '/orders/done' => 'orders#order_done'
    # resources :addresses, only: [:index, :show, :dreate, :edit, :update, :destroy]
    resources :addresses, except: [:new]
  end
  
  namespace :admin do
    get '/' => 'admin/homes#top'
    resources :items, except: [:destroy]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:index, :show, :update]
    resources :order_details, only: [:update]
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
