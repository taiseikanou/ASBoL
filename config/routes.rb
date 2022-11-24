Rails.application.routes.draw do
  devise_for :members, controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  devise_for :admin, controllers: {
    sessions: 'admin/sessions'
  }

  scope module: :public do
      root to: "homes#top"
      post '/guests/guest_sign_in', to: 'guests#new_guest'
      resources :members,only:[:show,:update,:create,:edit,:index]do
         resource :relationships, only: [:create,:destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
      end
      get 'posts/select'=>'posts#select',as: 'select'
      get 'posts/favoritepost' => 'posts#favoritepost', as: 'favoritepost'
      get '/posts/:id/post_comment' => 'posts#post_comment', as: 'post_comment'
      resources :posts, only: [:index,:show,:update,:create,:edit,:new,:destroy
      ]do
       resources :post_comments, only: [:create,:destroy]
       resource :favorites, only: [:create, :destroy]
     end
     get "search" => "searches#search"
     get '/member/:id/unsubscribe' => 'members#unsubscribe', as: 'unsubscribe'
     # 論理削除用のルーティング
     patch '/member/:id/withdrawal' => 'members#withdrawal', as: 'withdrawal'
     resources :maps, only: [:index]
     end

  namespace :admin do
    root to: "homes#top"
    post '/guests/guest_sign_in', to: 'guests#new_guest'
    resources :members,only:[:index,:show,:update,:create,:edit]do
    end
    resources :posts, only: [:index,:show,:update,:create,:edit,:destroy]do
      resources :post_comments, only: [:create,:destroy]
    end
    get "search" => "searches#search"
    end
end
