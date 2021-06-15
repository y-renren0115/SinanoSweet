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
    resources :items, only: [:index]
    resources :cart_items, only: [:index, :update, :create]
    resource :customers, only: [:show, :edit, :update]
  end
  
  namespace :admin do
    get '/' => 'admin/homes#top'
    resources :items, except: [:destroy]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:index, :show, :update]
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
