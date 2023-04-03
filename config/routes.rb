Rails.application.routes.draw do
# 顧客用
# URL /customers/sign_in ...
devise_for :customers, controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, controllers: {
  sessions: "admin/sessions"
}
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

# 会員側のルーティング設定
  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about'
    get 'rules' => 'homes#rules'
    post 'homes/guest_sign_in' => 'homes#new_guest'

    get 'customers/my_page' => 'customers#show'
    get 'customers/information/edit' => 'customers#edit'
    patch 'customers/information' => 'customers#update'
    get 'customers/unsubscribe' => 'customers#unsubscribe'
    patch 'customers/reject_customer' => 'customers#reject_customer'

    resources :posts, only: [:index, :show, :new, :edit, :create, :update, :destroy] do

      # postにネスト
      resource :bookmarks, only: [:create, :destroy]

      resources :comments, only: [:create, :update, :destroy, :show]
    end
    get 'bookmarks' => 'bookmarks#index'

  end

# 管理者側のルーティング設定
  namespace :admin do

    root to: 'homes#top'

    resources :customers, only: [:index, :show, :edit, :destroy]

    resources :comments, only: [:index, :show, :destroy]
    get 'delete_comments' => 'comments#delete_comments'

    resources :announcements

  end

  get 'search' => 'searches#search'

end
