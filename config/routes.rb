Rails.application.routes.draw do

  namespace :public do
    get 'relationships/followings'
    get 'relationships/followers'
  end
  namespace :public do
    get 'comments/index'
    get 'comments/show'
  end
  namespace :admin do
    get 'comments/index'
    get 'comments/show'
  end
  devise_for :members, controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }


  devise_for :admin, controllers: {
    sessions: "admin/sessions"
  }
  scope module: :public do
      root to: "homes#top"
      post '/guests/guest_sign_in', to: 'guests#new_guest'
      resources :members,only:[:show,:update,:create,:edit,:index]do
         resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
      end
      resources :posts, only: [:index,:show,:update,:create,:edit,:new]do
       resources :post_comments, only: [:create]
       resource :favorites, only: [:create, :destroy]
     end
     get "search" => "searches#search"
     get 'members/unsubscribe' => 'members#unsubscribe', as: 'unsubscribe'
     patch 'members/withdraw' => 'members#withdraw', as: 'withdraw'
  end



  namespace :admin do
      root to: "homes#top"
      resources :members,only:[:index,:show,:update,:create]do
      post '/guests/guest_sign_in', to: 'guests#new_guest'
    end
    resources :posts, only: [:index,:show,:update,:create,:edit,:new]do
       resources :post_comments, only: [:create]
       resource :favorites, only: [:create, :destroy]
    end
    get "search" => "searches#search"
  end
end
