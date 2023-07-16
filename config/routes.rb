Rails.application.routes.draw do
  # root to: 'homes#about'
  # root to: 'public/homes#about'
  scope module: :public do
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
    get 'genres/index'
    get 'genres/edit'
  end
  namespace :admin do
    get 'items/index'
    get 'items/new'
    get 'items/show'
    get 'items/edit'
  end
  namespace :admin do
    get 'homes/top'
  end
  namespace :public do
    get 'shipping_addresses/index'
    get 'shipping_addresses/edit'
  end
  namespace :public do
    get 'orders/new'
    get 'orders/index'
    get 'orders/complete'
    get 'orders/show'
  end
  namespace :public do
    get 'cart_items/index'
  end
  scope module: :public do
    get 'customers/mypage' => 'customers#show'
    get 'customers/introduction/edit' => 'customers#edit'
    patch 'customers/introduction' => 'customers#update'
    get 'customers/confirm' => 'customers#confirm'
    patch 'customers/withdraw' => 'customers#withdraw'
  end
  namespace :public do
    get 'items/index'
    get 'items/show'
  end
  # namespace :public do
  #   get 'homes/top', as: 'top'
  #   get 'homes/about', as: 'about'
  # end
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
