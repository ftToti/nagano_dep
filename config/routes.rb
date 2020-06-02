Rails.application.routes.draw do
  devise_for :admins, controllers: {
  	sessions:      'admins/admins/sessions',
  	passwords:     'admins/admins/passwords',
  	registrations: 'admins/admins/registrations'
  }
  devise_for :members, controllers: {
  	sessions:      'members/members/sessions',
  	passwords:     'members/members/passwords',
  	registrations: 'members/members/registrations'
  }

  namespace :admins do
    get '/top', to: 'top#top', as: 'top'
    resources :members, only: [:index, :show, :edit, :update]
    resources :orders, only: [:index, :show, :update]
    resources :order_products, only: [:update]
    resources :products, only: [:index, :show, :new, :create, :edit, :update]
    resources :product_genres, only: [:index, :create, :edit, :update]
  end

  namespace :members do
    get '/top', to: 'top#top', as: 'top'
    get '/top/about', to: 'top#about', as: 'about'
    delete '/cart_items', to: 'cart_items#destroy_all', as: 'destroy_all'
    get '/disable_confirm', to: 'members#disable_confirm', as: 'disable_confirm'
    patch '/disable/:id', to: 'members#disable', as: 'disable'
    get '/orders/confirm', to: 'orders#confirm', as: 'confirm'
    get '/orders/thanks', to: 'orders#thanks', as: 'thanks'
    resources :members, only: [:show, :edit, :update]
    resources :cart_items, only: [:show, :create, :update, :destroy]
    resources :orders, only: [:index, :show, :new, :create, :update]
    resources :products, only: [:index, :show]
    resources :shipping_addresses, only: [:index, :create, :edit, :update, :destroy]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
