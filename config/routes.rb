Rails.application.routes.draw do
  root to: 'public/homes#top'

  scope module: :public do
    get 'customers/mypage' => 'customers#show'
    get 'customers/introduction/edit' => 'customers#edit'
    patch 'customers/introduction' => 'customers#update'
    get 'customers/confirm' => 'customers#confirm'
    patch 'customers/withdraw' => 'customers#withdraw'

    get 'homes/about' => 'homes#about'

    resources :shipping_addresses, only:  [:index, :create, :edit, :update, :destroy]
    resources :cart_items, only: [:index, :create, :update, :destroy]do
      collection do
        delete "all_destroy"
      end
    end

    get 'items' => 'items#index'
    get 'items/:id' => 'items#show', as: 'item_show'
    get 'search' => 'searches#search'
    resources :genre_searches, only: [:show]

    get 'orders' => 'orders#index'
    get 'orders/new' => 'orders#new'
    get 'orders/complete' => 'orders#complete'
    post 'orders/confirm' => 'orders#confirm'
    # get 'orders/show' => 'orders#show'
    resources :orders, only:  [:create, :show]
  end

  namespace :admin do
    get '/' => 'homes#top'
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
    resources :customers, only: %i[index show edit update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :genre_searches, only: [:show]
    resources :order_searches, only: [:show]
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
  end

# 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
