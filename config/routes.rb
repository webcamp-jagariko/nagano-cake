Rails.application.routes.draw do
  root to: 'public/homes#top'
  scope module: :public do
    get 'customers/mypage' => 'customers#show'
    get 'customers/introduction/edit' => 'customers#edit'
    patch 'customers/introduction' => 'customers#update'
    get 'customers/confirm' => 'customers#confirm'
    patch 'customers/withdraw' => 'customers#withdraw'

    get 'homes/top' => 'homes#top'
    get 'homes/about' => 'homes#about'
  end
  namespace :admin do
    get 'orders/show'
  end
  namespace :admin do
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
  end

  namespace :admin do
    resources :genres, only: [:index, :create, :edit, :update]
  end

  namespace :admin do
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
  end

  namespace :admin do
    get 'homes/top'
  end
  scope module: :public do
    get 'shipping_addresses' => 'shipping_addresses#index'
    get 'shipping_addresses/id/edit' => 'shipping_addresses#edit', as: 'shipping_addresses_edit'
  end
  scope module: :public do
    get 'orders' => 'orders#index'
    get 'orders/new' => 'orders#new'
    get 'orders/complete' => 'orders#complete'
    get 'orders/show' => 'orders#show'
  end
  namespace :public do
    get 'cart_items/index'
  end

  namespace :public do
    get 'items/index'
    get 'items/show'
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
